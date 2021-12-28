import 'package:dartz/dartz.dart';
import 'package:smart_password_clean_architechture/core/error/failures.dart';
import 'package:smart_password_clean_architechture/core/utils/database_util.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/entities/password.dart';

class SmartPasswordClient {
  DatabaseUtil databaseUtil;

  SmartPasswordClient({this.databaseUtil});
  List<Password> lstPassword = [
    Password(desc: 'Desc', name: 'Name', password: 'asdf')
  ];

  List<Password> getAllPasswords() {
    return lstPassword;
  }

  bool addPassword(Password password) {}
  bool updatePassword(Password password) {}
  bool deletePassword(Password password) {}
}
