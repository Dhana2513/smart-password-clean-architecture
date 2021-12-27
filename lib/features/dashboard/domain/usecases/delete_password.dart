import 'package:dartz/dartz.dart';
import 'package:smart_password_clean_architechture/core/error/failures.dart';
import 'package:smart_password_clean_architechture/core/usecases/usecases.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/entities/password.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/repositories/repository_protocol.dart';

class DeletePassword extends UseCase<bool, Password> {
  final RepositoryProtocol repository;

  DeletePassword(this.repository);

  @override
  Future<Either<Failure, bool>> call(Password password) {
    return repository.deletePassword(password);
  }
}
