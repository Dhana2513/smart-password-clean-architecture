import 'package:dartz/dartz.dart';
import 'package:smart_password_clean_architechture/core/error/failures.dart';
import 'package:smart_password_clean_architechture/features/dashboard/data/client/smart_password_client.dart';
import 'package:smart_password_clean_architechture/features/dashboard/data/datasource/local_datasource_protocol.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/entities/password.dart';
import 'package:smart_password_clean_architechture/features/login/data/client/login_client.dart';
import 'package:smart_password_clean_architechture/features/login/data/datasource/login_local_datasource_protocol.dart';

class LoginLocalDataSource extends LoginLocalDataSourceProtocol {
  final LoginClient client;

  LoginLocalDataSource({this.client});

  @override
  Future<Either<Failure, bool>> addPattern(String pattern) {}

  @override
  Future<Either<Failure, bool>> checkPattern(String pattern) {}

  @override
  Future<Either<Failure, bool>> isPatternSet() {}

  @override
  Future<Either<Failure, bool>> updatePattern(String pattern) {}

  @override
  Future<Either<Failure, bool>> addMasterPassword(String masterPassword) {}

  @override
  Future<Either<Failure, String>> getMasterPassword() {}

  @override
  Future<Either<Failure, bool>> isMasterPasswordSet() {}
}
