import 'package:smart_password_clean_architechture/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_password_clean_architechture/core/usecases/usecases.dart';
import 'package:smart_password_clean_architechture/features/login/domain/repositories/login_repository_protocol.dart';

class IsPatternSet extends UseCase<bool, NoParams> {
  final LoginRepositoryProtocol repository;

  IsPatternSet(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.isPatternSet();
  }
}
