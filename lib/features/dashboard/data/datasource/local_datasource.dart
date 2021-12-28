import 'package:dartz/dartz.dart';
import 'package:smart_password_clean_architechture/core/error/failures.dart';
import 'package:smart_password_clean_architechture/features/dashboard/data/client/smart_password_client.dart';
import 'package:smart_password_clean_architechture/features/dashboard/data/datasource/local_datasource_protocol.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/entities/password.dart';

class LocalDataSource extends LocalDataSourceProtocol {
  final SmartPasswordClient client;

  LocalDataSource({this.client});

  @override
  Either<Failure, bool> addPassword(Password password)  {
    final result =  client.addPassword(password);
    return Right(result);
  }

  @override
  Either<Failure, bool> deletePassword(Password password)  {
    final result =  client.deletePassword(password);
    return Right(result);
  }

  @override
  Either<Failure, List<Password>> getAllPasswords()  {
    final result =  client.getAllPasswords();
    return Right(result);
  }

  @override
  Either<Failure, bool> updatePassword(Password password)  {
    final result =  client.updatePassword(password);
    return Right(result);
  }

}
