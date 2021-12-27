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

  
  Future<List<Password>> getAllPasswords() async {
    return lstPassword;
  }

  Future<bool> addPassword(Password password) async {}
  Future<bool> updatePassword(Password password) async {}
  Future<bool> deletePassword(Password password) async {}

}
