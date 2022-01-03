import 'package:smart_password_clean_architecture/core/utils/database_util.dart';

class LoginClient {
  final DatabaseUtil _databaseUtil;

  LoginClient({
    DatabaseUtil databaseUtil,
  }) : _databaseUtil = databaseUtil;

  bool isPatternSet() {
    return _databaseUtil.isPatternSet();
  }

  void addPattern(String pattern) {
    _databaseUtil.putPattern(pattern);
  }

  bool checkPattern(String pattern) {
    var dbPattern = _databaseUtil.getPattern();
    return dbPattern == pattern;
  }

  void updatePattern(String pattern) {
    _databaseUtil.putPattern(pattern);
  }

  bool isMasterPasswordSet() {
    return _databaseUtil.isMasterPasswordSet();
  }

  void addMasterPassword(String masterPassword) {
    _databaseUtil.putMasterPassword(masterPassword);
  }

  bool checkMasterPassword(String masterPassword) {
    var dbMasterPassword = _databaseUtil.getMasterPassword();
    return dbMasterPassword == masterPassword;
  }
}
