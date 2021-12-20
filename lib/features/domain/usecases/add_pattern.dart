import 'package:dartz/dartz.dart';
import 'package:smart_password_clean_architechture/core/error/failures.dart';
import 'package:smart_password_clean_architechture/core/usecases/usecases.dart';
import 'package:smart_password_clean_architechture/features/data/repositories/repository.dart';

class AddPattern extends UseCase<bool, String> {
  final Repository repository;

  AddPattern(this.repository);

  @override
  Future<Either<Failure, bool>> call(String pattern) async {
    return await repository.addPattern(pattern);
  }
}
