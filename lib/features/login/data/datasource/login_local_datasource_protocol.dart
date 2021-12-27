import 'package:dartz/dartz.dart';
import 'package:smart_password_clean_architechture/core/error/failures.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/entities/password.dart';

abstract class LoginLocalDataSourceProtocol {
  Future<Either<Failure, bool>> isPatternSet();
  Future<Either<Failure, bool>> addPattern(String pattern);
  Future<Either<Failure, bool>> checkPattern(String pattern);
  Future<Either<Failure, bool>> updatePattern(String pattern);
  

   Future<Either<Failure, bool>>  isMasterPasswordSet();
   Future<Either<Failure, bool>>  addMasterPassword(String masterPassword);
   Future<Either<Failure, String>>  getMasterPassword();
}
