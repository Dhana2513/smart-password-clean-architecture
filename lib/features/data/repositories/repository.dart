import 'package:dartz/dartz.dart';
import 'package:smart_password_clean_architechture/core/error/failures.dart';
import 'package:smart_password_clean_architechture/features/data/datasource/local_datasource.dart';
import 'package:smart_password_clean_architechture/features/domain/entities/password.dart';
import 'package:smart_password_clean_architechture/features/domain/repositories/repository_protocol.dart';

class Repository extends RepositoryProtocol{
  final LocalDataSource dataSource;

  Repository({this.dataSource});
    
  @override
  Future<Either<Failure, bool>> addPassword(Password password) {
    return dataSource.addPassword(password);
  }

  @override
  Future<Either<Failure, bool>> addPattern(String pattern) {
    return dataSource.addPattern(pattern);
  }

  @override
  Future<Either<Failure, bool>> checkPattern(String pattern) {
    return dataSource.checkPattern(pattern);
  }

  @override
  Future<Either<Failure, bool>> deletePassword(Password password) {
    return dataSource.deletePassword(password);
  }

  @override
  Future<Either<Failure, List<Password>>> getAllPasswords() {
    return dataSource.getAllPasswords();
  }

  @override
  Future<Either<Failure, bool>> updatePassword(Password password) {
    return dataSource.updatePassword(password);
  }
}