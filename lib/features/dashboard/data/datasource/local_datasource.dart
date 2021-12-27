import 'package:dartz/dartz.dart';
import 'package:smart_password_clean_architechture/core/error/failures.dart';
import 'package:smart_password_clean_architechture/features/dashboard/data/client/smart_password_client.dart';
import 'package:smart_password_clean_architechture/features/dashboard/data/datasource/local_datasource_protocol.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/entities/password.dart';

class LocalDataSource extends LocalDataSourceProtocol {
  final SmartPasswordClient client;

  LocalDataSource({this.client});

  @override
  Future<Either<Failure, bool>> addPassword(Password password) async {
    final result = await client.addPassword(password);
    return Right(result);
  }

  @override
  Future<Either<Failure, bool>> deletePassword(Password password) async {
    final result = await client.deletePassword(password);
    return Right(result);
  }

  @override
  Future<Either<Failure, List<Password>>> getAllPasswords() async {
    final result = await client.getAllPasswords();
    return Right(result);
  }

  @override
  Future<Either<Failure, bool>> updatePassword(Password password) async {
    final result = await client.updatePassword(password);
    return Right(result);
  }

}
