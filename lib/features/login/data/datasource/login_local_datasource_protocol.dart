import 'package:dartz/dartz.dart';
import 'package:smart_password_clean_architecture/core/error/failures.dart';

abstract class LoginLocalDataSourceProtocol {
  Either<Failure, bool> isPatternSet();
  void addPattern(String pattern);
  Either<Failure, bool> checkPattern(String pattern);
  void updatePattern(String pattern);

  Either<Failure, bool> isMasterPasswordSet();
  void addMasterPassword(String masterPassword);
  Either<Failure, bool> checkMasterPassword(String masterPassword);
}
