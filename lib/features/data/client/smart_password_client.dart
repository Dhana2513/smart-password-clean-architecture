import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_password_clean_architechture/core/error/failures.dart';
import 'package:smart_password_clean_architechture/features/domain/entities/password.dart';

class SmartPasswordClient {
  final SharedPreferences sharedPreferences;

  SmartPasswordClient({this.sharedPreferences});

  Future<bool> addPattern(String pattern) {}
  Future<bool> checkPattern(String pattern) {}

  Future<List<Password>> getAllPasswords() {}

  Future<bool> addPassword(Password password) {}
  Future<bool> updatePassword(Password password) {}
  Future<bool> deletePassword(Password password) {}
}
