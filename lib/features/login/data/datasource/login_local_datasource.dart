import 'package:dartz/dartz.dart';
import 'package:smart_password_clean_architechture/core/error/failures.dart';
import 'package:smart_password_clean_architechture/features/login/data/client/login_client.dart';
import 'package:smart_password_clean_architechture/features/login/data/datasource/login_local_datasource_protocol.dart';

class LoginLocalDataSource extends LoginLocalDataSourceProtocol {
  final LoginClient client;

  LoginLocalDataSource({this.client});

  @override
  void addPattern(String pattern) {
    client.addPattern(pattern);
  }

  @override
  Either<Failure, bool> checkPattern(String pattern) {
    return Right(client.checkPattern(pattern));
  }

  @override
  Either<Failure, bool> isPatternSet() {
    return Right(client.isPatternSet());
  }

  @override
  void updatePattern(String pattern) {
    client.updatePattern(pattern);
  }

  @override
  void addMasterPassword(String masterPassword) {
    client.addMasterPassword(masterPassword);
  }

  @override
  Either<Failure, bool> checkMasterPassword(String masterPassword) {
    return Right(client.checkMasterPassword(masterPassword));
  }

  @override
  Either<Failure, bool> isMasterPasswordSet() {
      return Right(client.isMasterPasswordSet());
  }
}
