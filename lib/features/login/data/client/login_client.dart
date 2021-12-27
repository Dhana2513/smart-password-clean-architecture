import 'package:smart_password_clean_architechture/core/utils/database_util.dart';

class LoginClient {
  DatabaseUtil databaseUtil;
  LoginClient({
    this.databaseUtil,
  });
  
  Future<bool> isPatternSet() {}
  Future<bool> addPattern(String pattern) {}
  Future<bool> checkPattern(String pattern) {}
  Future<bool> updatePattern(String pattern) {}

  Future<bool> isMasterPasswordSet() {}
  Future<bool> addMasterPassword(String masterPassword) {}
  Future<String> getMasterPassword() {}
}
