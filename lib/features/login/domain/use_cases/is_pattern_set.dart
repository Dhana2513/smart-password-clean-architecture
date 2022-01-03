import 'package:dartz/dartz.dart';
import 'package:smart_password_clean_architecture/core/error/failures.dart';
import 'package:smart_password_clean_architecture/features/login/domain/repositories/login_repository_protocol.dart';

class IsPatternSet {
  final LoginRepositoryProtocol repository;

  IsPatternSet(this.repository);

  Either<Failure, bool> call() {
    return repository.isPatternSet();
  }
}
