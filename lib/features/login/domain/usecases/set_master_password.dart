import 'package:dartz/dartz.dart';
import 'package:smart_password_clean_architechture/core/error/failures.dart';
import 'package:smart_password_clean_architechture/core/usecases/usecases.dart';
import 'package:smart_password_clean_architechture/features/login/domain/repositories/login_repository_protocol.dart';

class SetMasterPassword extends UseCase<bool, String> {
  final LoginRepositoryProtocol repository;

  SetMasterPassword(this.repository);

  @override
  Future<Either<Failure, bool>> call(String pattern)  {
    return  repository.setMasterPassword(pattern);
  }
}
