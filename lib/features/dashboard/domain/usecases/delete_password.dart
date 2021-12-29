import 'package:smart_password_clean_architechture/features/dashboard/domain/entities/password.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/repositories/repository_protocol.dart';

class DeletePassword {
  final RepositoryProtocol repository;

  DeletePassword(this.repository);

  void call(Password password) {
    repository.deletePassword(password);
  }
}
