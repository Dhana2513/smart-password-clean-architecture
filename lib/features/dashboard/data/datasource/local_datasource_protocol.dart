import 'package:dartz/dartz.dart';
import 'package:smart_password_clean_architecture/core/error/failures.dart';
import 'package:smart_password_clean_architecture/features/dashboard/domain/entities/password.dart';

abstract class LocalDataSourceProtocol {
  Either<Failure, List<Password>> getAllPasswords();
  void addPassword(Password password);
  void updatePassword(Password password);
  void deletePassword(Password password);
}
