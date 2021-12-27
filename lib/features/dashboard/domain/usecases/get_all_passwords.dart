import 'package:dartz/dartz.dart';
import 'package:smart_password_clean_architechture/core/error/failures.dart';
import 'package:smart_password_clean_architechture/core/usecases/usecases.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/entities/password.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/repositories/repository_protocol.dart';

class GettAllPasswords extends UseCase<List<Password>, NoParams> {
  final RepositoryProtocol repository;

  GettAllPasswords(this.repository);

  @override
  Future<Either<Failure, List<Password>>> call(NoParams password) {
    return repository.getAllPasswords();
  }
}
