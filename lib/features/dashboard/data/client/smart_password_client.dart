import 'package:smart_password_clean_architechture/core/utils/database_util.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/entities/password.dart';

class SmartPasswordClient {
  DatabaseUtil databaseUtil;

  SmartPasswordClient({this.databaseUtil});

  List<Password> getAllPasswords() {
    return databaseUtil.getAllPasswords();
  }

  void addPassword(Password password) {
    databaseUtil.addPassword(password);
  }

  void updatePassword(Password password) {
    databaseUtil.updatePassword(password);
  }

  void deletePassword(Password password) {
    databaseUtil.deletePassword(password);
  }
}
