import 'package:smart_password_clean_architechture/features/login/domain/repositories/login_repository_protocol.dart';

class SetMasterPassword {
  final LoginRepositoryProtocol repository;

  SetMasterPassword(this.repository);

  void call(String masterPassword) {
    repository.addMasterPassword(masterPassword);
  }
}
