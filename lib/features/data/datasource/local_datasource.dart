import 'package:dartz/dartz.dart';
import 'package:smart_password_clean_architechture/core/error/failures.dart';
import 'package:smart_password_clean_architechture/features/data/client/smart_password_client.dart';
import 'package:smart_password_clean_architechture/features/data/datasource/local_datasource_protocol.dart';
import 'package:smart_password_clean_architechture/features/domain/entities/password.dart';

class LocalDataSource extends LocalDataSourceProtocol {
  final SmartPasswordClient client;

  LocalDataSource({this.client});

  @override
  Future<Either<Failure, bool>> addPassword(Password password) async {
    final result = await client.addPassword(password);
  }

  @override
  Future<Either<Failure, bool>> addPattern(String pattern) async {
    final result = await client.addPattern(pattern);
  }

  @override
  Future<Either<Failure, bool>> checkPattern(String pattern) async {
    final result = await client.checkPattern(pattern);
  }

  @override
  Future<Either<Failure, bool>> deletePassword(Password password) async {
    final result = await client.deletePassword(password);
  }

  @override
  Future<Either<Failure, List<Password>>> getAllPasswords() async {
    final result = await client.getAllPasswords();
  }

  @override
  Future<Either<Failure, bool>> updatePassword(Password password) async {
    final result = await client.updatePassword(password);
  }
}
