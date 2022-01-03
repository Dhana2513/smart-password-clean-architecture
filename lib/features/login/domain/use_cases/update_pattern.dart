import 'package:smart_password_clean_architecture/features/login/domain/repositories/login_repository_protocol.dart';

class UpdatePattern {
  final LoginRepositoryProtocol repository;

  UpdatePattern(this.repository);

  void call(String pattern) {
    repository.updatePattern(pattern);
  }
}
