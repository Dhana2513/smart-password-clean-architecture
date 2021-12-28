import 'package:dartz/dartz.dart';
import 'package:smart_password_clean_architechture/core/error/failures.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/entities/password.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/repositories/repository_protocol.dart';

class AddPassword {
  final RepositoryProtocol repository;

  AddPassword(this.repository);

  void call(Password password) {
    repository.addPassword(password);
  }
}
