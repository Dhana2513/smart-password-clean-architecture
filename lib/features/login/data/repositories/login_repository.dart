import 'package:dartz/dartz.dart';
import 'package:smart_password_clean_architechture/core/error/failures.dart';
import 'package:smart_password_clean_architechture/features/login/data/datasource/login_local_datasource_protocol.dart';
import 'package:smart_password_clean_architechture/features/login/domain/repositories/login_repository_protocol.dart';

class LoginRepository extends LoginRepositoryProtocol {
  final LoginLocalDataSourceProtocol dataSource;

  LoginRepository({this.dataSource});

  @override
  void addPattern(String pattern) {
    dataSource.addPattern(pattern);
  }

  @override
  Either<Failure, bool> checkPattern(String pattern) {
    return dataSource.checkPattern(pattern);
  }

  @override
  Either<Failure, bool> isPatternSet() {
    return dataSource.isPatternSet();
  }

  @override
  void updatePattern(String pattern) {
    dataSource.updatePattern(pattern);
  }

  @override
  void addMasterPassword(String masterPassword) {
    dataSource.addMasterPassword(masterPassword);
  }

  @override
  Either<Failure, bool> checkMasterPassword(String masterPassword) {
    return dataSource.checkMasterPassword(masterPassword);
  }

  @override
  Either<Failure, bool> isMasterPasswordSet() {
    return dataSource.isMasterPasswordSet();
  }
}
