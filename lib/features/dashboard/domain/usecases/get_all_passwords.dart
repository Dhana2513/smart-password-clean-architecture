import 'package:dartz/dartz.dart';
import 'package:smart_password_clean_architecture/core/error/failures.dart';
import 'package:smart_password_clean_architecture/features/dashboard/domain/entities/password.dart';
import 'package:smart_password_clean_architecture/features/dashboard/domain/repositories/repository_protocol.dart';

class GettAllPasswords {
  final RepositoryProtocol repository;

  GettAllPasswords(this.repository);

  Either<Failure, List<Password>> call() {
    return repository.getAllPasswords();
  }
}
