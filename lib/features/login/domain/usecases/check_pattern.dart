import 'package:dartz/dartz.dart';
import 'package:smart_password_clean_architechture/core/error/failures.dart';
import 'package:smart_password_clean_architechture/features/login/domain/repositories/login_repository_protocol.dart';

class CheckPattern  {
  final LoginRepositoryProtocol repository;

  CheckPattern(this.repository);
  
  Either<Failure, bool> call(String pattern)  {
    return  repository.checkPattern(pattern);
  }
}
