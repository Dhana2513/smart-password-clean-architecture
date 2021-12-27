import 'package:hive/hive.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/entities/password.dart';

class DatabaseUtil {
  static final instance = DatabaseUtil._();
  DatabaseUtil._() {
    init();
  }

  Box _masterPasswordBox;
  Box<Password> _passwordsBox;

  init() async {
    _masterPasswordBox = Hive.box('masterPasswordBox');
    _passwordsBox = await Hive.openBox<Password>('passwordsBox');
  }

  String get masterPassword => _masterPasswordBox.get('masterPassword');

  void putMasterPassword(String masterPassword) {
    _masterPasswordBox.put('masterPassword', masterPassword);
  }

  void addPassword(Password password) {
    _passwordsBox.add(password);
  }

  List<Password> getAllPasswords() {
    return _passwordsBox.values.toList().cast<Password>();
  }

  void close() {
    // _masterPasswordBox.close();
    // _passwordsBox.close();
    Hive.close();
  }
}
