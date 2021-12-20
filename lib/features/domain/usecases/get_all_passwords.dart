import 'package:dartz/dartz.dart';
import 'package:smart_password_clean_architechture/core/error/failures.dart';
import 'package:smart_password_clean_architechture/core/usecases/usecases.dart';
import 'package:smart_password_clean_architechture/features/data/repositories/repository.dart';
import 'package:smart_password_clean_architechture/features/domain/entities/password.dart';

class GettAllPasswords extends UseCase<List<Password>, void> {
  final Repository repository;

  GettAllPasswords(this.repository);

  @override
  Future<Either<Failure, List<Password>>> call(void password) async {
    return await repository.getAllPasswords();
  }
}
