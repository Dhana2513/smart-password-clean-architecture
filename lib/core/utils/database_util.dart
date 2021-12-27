import 'package:hive/hive.dart';
import 'package:smart_password_clean_architechture/core/utils/encryption_decryption_util.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/entities/password.dart';

class DatabaseUtil {
  static final instance = DatabaseUtil._();
  DatabaseUtil._() {
    init();
  }

  Box _keyValueBox;
  Box<Password> _passwordsBox;
  EncryptionDecryptionUtil encryptionDecryptionUtil;

  init() async {
    _keyValueBox = Hive.box('keyValueBox');
    _passwordsBox = await Hive.openBox<Password>('passwordsBox');
    initEncryptionDecryptionUtil();
  }

  void initEncryptionDecryptionUtil() {
    String masterPassword = _keyValueBox.get('masterPassword') ?? '';
    String masterKey =
        EncryptionDecryptionUtil.getInstance().decrypt(masterPassword);

    encryptionDecryptionUtil =
        EncryptionDecryptionUtil.getInstance(masterKey: masterKey);
  }

  String getpattern() {
    String pattern = _keyValueBox.get('pattern') ?? '';
    return pattern.isEmpty ? '' : encryptionDecryptionUtil.decrypt(pattern);
  }

  void putMasterPassword(String masterPassword) {
    String master =
        EncryptionDecryptionUtil.getInstance().encrypt(masterPassword);
    _keyValueBox.put('masterPassword', master);
  }

  void putPattern(String pattern) {
    _keyValueBox.put('pattern', encryptionDecryptionUtil.encrypt(pattern));
  }

  void addPassword(Password password) {
    var addPassword = Password(
      name: encryptionDecryptionUtil.encrypt(password.name),
      desc: encryptionDecryptionUtil.encrypt(password.desc),
      password: encryptionDecryptionUtil.encrypt(password.password),
    );
    _passwordsBox.add(addPassword);
  }

  bool isPatternSet() {
    String pattern = _keyValueBox.get('pattern') ?? '';
    return pattern.isNotEmpty;
  }

  bool isMasterPasswordSet() {
    String password = _keyValueBox.get('masterPassword') ?? '';
    return password.isNotEmpty;
  }

  List<Password> getAllPasswords() {
    List<Password> lstPasswords =
        _passwordsBox.values.toList().cast<Password>();

    List<Password> lstDecryptedPasswords = [];

    lstPasswords.forEach((element) {
      lstDecryptedPasswords.add(Password(
        name: encryptionDecryptionUtil.decrypt(element.name),
        desc: encryptionDecryptionUtil.decrypt(element.desc),
        password: encryptionDecryptionUtil.decrypt(element.password),
      ));
    });

    return lstDecryptedPasswords;
  }

  void close() {
    Hive.close();
  }
}
