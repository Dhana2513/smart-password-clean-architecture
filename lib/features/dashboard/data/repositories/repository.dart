import 'package:dartz/dartz.dart';
import 'package:smart_password_clean_architecture/core/error/failures.dart';
import 'package:smart_password_clean_architecture/features/dashboard/data/datasource/local_datasource_protocol.dart';
import 'package:smart_password_clean_architecture/features/dashboard/domain/entities/password.dart';
import 'package:smart_password_clean_architecture/features/dashboard/domain/repositories/repository_protocol.dart';

class Repository extends RepositoryProtocol {
  final LocalDataSourceProtocol dataSource;

  Repository({this.dataSource});

  @override
  void addPassword(Password password) {
    dataSource.addPassword(password);
  }

  @override
  void deletePassword(Password password) {
    dataSource.deletePassword(password);
  }

  @override
  Either<Failure, List<Password>> getAllPasswords() {
    return dataSource.getAllPasswords();
  }

  @override
  void updatePassword(Password password) {
    dataSource.updatePassword(password);
  }
}
