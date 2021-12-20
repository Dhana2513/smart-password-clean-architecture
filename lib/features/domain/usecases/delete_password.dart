import 'package:dartz/dartz.dart';
import 'package:smart_password_clean_architechture/core/error/failures.dart';
import 'package:smart_password_clean_architechture/core/usecases/usecases.dart';
import 'package:smart_password_clean_architechture/features/data/repositories/repository.dart';
import 'package:smart_password_clean_architechture/features/domain/entities/password.dart';

class DeletePassword extends UseCase<bool, Password> {
  final Repository repository;

  DeletePassword(this.repository);

  @override
  Future<Either<Failure, bool>> call(Password password) async {
    return await repository.deletePassword(password);
  }
}
