import 'package:dartz/dartz.dart';
import 'package:smart_password_clean_architechture/core/error/failures.dart';
import 'package:smart_password_clean_architechture/features/login/data/datasource/login_local_datasource_protocol.dart';
import 'package:smart_password_clean_architechture/features/login/domain/repositories/login_repository_protocol.dart';

class LoginRepository extends LoginRepositoryProtocol {
  final LoginLocalDataSourceProtocol dataSource;

  LoginRepository({this.dataSource});


  @override
  Future<Either<Failure, bool>> addPattern(String pattern) {}

  @override
  Future<Either<Failure, bool>> checkPattern(String pattern) {}


  @override
  Future<Either<Failure, bool>> isPatternSet() {}

  @override
  Future<Either<Failure, bool>> updatePattern(String pattern) {}

  @override
  Future<Either<Failure, bool>> setMasterPassword(String masterPassword) {
   
  }

  @override
  Future<Either<Failure, String>> getMasterPassword() {
   
  }

  @override
  Future<Either<Failure, bool>> isMasterPasswordSet() {
   
  }
}
