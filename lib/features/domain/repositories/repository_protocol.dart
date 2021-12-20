import 'package:dartz/dartz.dart';
import 'package:smart_password_clean_architechture/core/error/failures.dart';
import 'package:smart_password_clean_architechture/features/domain/entities/password.dart';

abstract class RepositoryProtocol {
  // Future<bool> isUserCreatedMasterPassword();
  // Future<bool> addMasterPassword(String masterPassword);
  // Future<String> getMasterPassword();

  Future<Either<Failure, bool>> addPattern(String pattern);
  Future<Either<Failure, bool>> checkPattern(String pattern);

  Future<Either<Failure, List<Password>>> getAllPasswords();

  Future<Either<Failure, bool>> addPassword(Password password);
  Future<Either<Failure, bool>> updatePassword(Password password);
  Future<Either<Failure, bool>> deletePassword(Password password);
}
