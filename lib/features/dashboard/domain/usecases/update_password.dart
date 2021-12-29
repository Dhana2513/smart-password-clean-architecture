import 'package:smart_password_clean_architechture/features/dashboard/domain/entities/password.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/repositories/repository_protocol.dart';

class UpdatePassword {
  final RepositoryProtocol repository;

  UpdatePassword(this.repository);

  void call(Password password) {
    repository.updatePassword(password);
  }
}
