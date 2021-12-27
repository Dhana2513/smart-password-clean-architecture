import 'package:dartz/dartz.dart';
import 'package:smart_password_clean_architechture/core/error/failures.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/entities/password.dart';

abstract class RepositoryProtocol {

  Future<Either<Failure, List<Password>>> getAllPasswords();
  Future<Either<Failure, bool>> addPassword(Password password);
  Future<Either<Failure, bool>> updatePassword(Password password);
  Future<Either<Failure, bool>> deletePassword(Password password);
 
}
