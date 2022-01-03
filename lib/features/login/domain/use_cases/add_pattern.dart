import 'package:smart_password_clean_architecture/features/login/domain/repositories/login_repository_protocol.dart';

class AddPattern {
  final LoginRepositoryProtocol repository;

  AddPattern(this.repository);

  void call(String pattern) {
    repository.addPattern(pattern);
  }
}
