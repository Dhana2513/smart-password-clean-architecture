import 'package:hive/hive.dart';
import 'package:smart_password_clean_architechture/core/utils/encryption_decryption_util.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/entities/password.dart';

class DatabaseUtilsKeys {
  static const valueBox = 'keyValueBox';
  static const passwordsBox = 'passwordsBox';
  static const keyMasterPassword = 'masterPassword';
  static const keyPattern = 'pattern';
}

class DatabaseUtil {
  static final instance = DatabaseUtil._();
  DatabaseUtil._() {
    init();
  }

  Box _keyValueBox;
  Box<Password> _passwordsBox;
  EncryptionDecryptionUtil _encryptionDecryptionUtil;
  List<Password> _lstPasswords = [];

  static initDbUtil() async {
    await Hive.openBox(DatabaseUtilsKeys.valueBox);
    await Hive.openBox<Password>(DatabaseUtilsKeys.passwordsBox);
  }

  init() async {
    _keyValueBox = Hive.box(DatabaseUtilsKeys.valueBox);
    _passwordsBox =
        await Hive.openBox<Password>(DatabaseUtilsKeys.passwordsBox);
    initEncryptionDecryptionUtil();
  }

  void initEncryptionDecryptionUtil() {
    String masterPassword =
        _keyValueBox.get(DatabaseUtilsKeys.keyMasterPassword) ?? '';
    if (masterPassword.isNotEmpty) {
      String masterKey =
          EncryptionDecryptionUtil.getInstance().decrypt(masterPassword);

      _encryptionDecryptionUtil =
          EncryptionDecryptionUtil.getInstance(masterKey: masterKey);
    }
  }

  bool isMasterPasswordSet() {
    String password =
        _keyValueBox.get(DatabaseUtilsKeys.keyMasterPassword) ?? '';
    return password.isNotEmpty;
  }

  void putMasterPassword(String masterPassword) {
    String master =
        EncryptionDecryptionUtil.getInstance().encrypt(masterPassword);
    _keyValueBox.put(DatabaseUtilsKeys.keyMasterPassword, master);
    initEncryptionDecryptionUtil();
  }

  String getMasterPassword() {
    String masterPassword =
        _keyValueBox.get(DatabaseUtilsKeys.keyMasterPassword) ?? '';
    return masterPassword.isEmpty
        ? ''
        : EncryptionDecryptionUtil.getInstance().encrypt(masterPassword);
  }

  bool isPatternSet() {
    String pattern = _keyValueBox.get(DatabaseUtilsKeys.keyPattern) ?? '';
    return pattern.isNotEmpty;
  }

  void putPattern(String pattern) {
    _keyValueBox.put(DatabaseUtilsKeys.keyPattern,
        _encryptionDecryptionUtil.encrypt(pattern));
  }

  String getPattern() {
    String pattern = _keyValueBox.get(DatabaseUtilsKeys.keyPattern) ?? '';
    return pattern.isEmpty ? '' : _encryptionDecryptionUtil.decrypt(pattern);
  }

  void addPassword(Password password) {
    print(' add password ${password.name}');
    password.desc = _encryptionDecryptionUtil.encrypt(password.desc);
    password.name = _encryptionDecryptionUtil.encrypt(password.name);
    password.password = _encryptionDecryptionUtil.encrypt(password.password);
    _passwordsBox.add(password);
  }

  void updatePassword(Password password) {
    print(' update password ${password.dbKey}');

    Password dbPassword =
        _lstPasswords.singleWhere((element) => element.key == password.dbKey);

    dbPassword.desc = _encryptionDecryptionUtil.encrypt(password.desc);
    dbPassword.name = _encryptionDecryptionUtil.encrypt(password.name);
    dbPassword.password = _encryptionDecryptionUtil.encrypt(password.password);
    dbPassword.save();
  }

  void deletePassword(Password password) {
    print('delete call ${password.name}');
    Password dbPassword =
        _lstPasswords.singleWhere((element) => element.key == password.dbKey);
    dbPassword.delete();
  }

  List<Password> getAllPasswords() {
    _lstPasswords = _passwordsBox.values.toList().cast<Password>();
    print('getAllPasswords ${_lstPasswords.toString()}');
    List<Password> lstDecryptedPasswords = [];

    _lstPasswords.forEach((element) {
      lstDecryptedPasswords.add(Password(
        dbKey: element.key,
        desc: _encryptionDecryptionUtil.decrypt(element.desc),
        name: _encryptionDecryptionUtil.decrypt(element.name),
        password: _encryptionDecryptionUtil.decrypt(element.password),
      ));
    });

    return lstDecryptedPasswords;
  }

  void close() {
    Hive.close();
  }
}
