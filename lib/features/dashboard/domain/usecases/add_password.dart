import 'package:smart_password_clean_architecture/features/dashboard/domain/entities/password.dart';
import 'package:smart_password_clean_architecture/features/dashboard/domain/repositories/repository_protocol.dart';

class AddPassword {
  final RepositoryProtocol repository;

  AddPassword(this.repository);

  void call(Password password) {
    repository.addPassword(password);
  }
}
