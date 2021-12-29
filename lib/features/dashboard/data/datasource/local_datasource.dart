import 'package:dartz/dartz.dart';
import 'package:smart_password_clean_architechture/core/error/failures.dart';
import 'package:smart_password_clean_architechture/features/dashboard/data/client/smart_password_client.dart';
import 'package:smart_password_clean_architechture/features/dashboard/data/datasource/local_datasource_protocol.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/entities/password.dart';

class LocalDataSource extends LocalDataSourceProtocol {
  final SmartPasswordClient client;

  LocalDataSource({this.client});

  @override
  void addPassword(Password password) {
    client.addPassword(password);
  }

  @override
  void deletePassword(Password password) {
    client.deletePassword(password);
  }

  @override
  Either<Failure, List<Password>> getAllPasswords() {
    final result = client.getAllPasswords();
    return Right(result);
  }

  @override
  void updatePassword(Password password) {
    client.updatePassword(password);
  }
}
