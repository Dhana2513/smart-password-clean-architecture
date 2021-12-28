import 'package:smart_password_clean_architechture/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_password_clean_architechture/features/login/domain/repositories/login_repository_protocol.dart';

class IsPatternSet {
  final LoginRepositoryProtocol repository;

  IsPatternSet(this.repository);

  Either<Failure, bool> call()  {
    return  repository.isPatternSet();
  }
}
