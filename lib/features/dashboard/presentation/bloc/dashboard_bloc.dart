import 'package:get_it/get_it.dart';
import 'package:smart_password_clean_architecture/features/dashboard/domain/entities/password.dart';
import 'package:smart_password_clean_architecture/features/dashboard/domain/use_cases/add_password.dart';
import 'package:smart_password_clean_architecture/features/dashboard/domain/use_cases/delete_password.dart';
import 'package:smart_password_clean_architecture/features/dashboard/domain/use_cases/get_all_passwords.dart';
import 'package:smart_password_clean_architecture/features/dashboard/domain/use_cases/update_password.dart';

class DashboardBloc {
  final GetAllPasswords _getAllPasswords;
  final UpdatePassword _updatePassword;
  final AddPassword _addPassword;
  final DeletePassword _deletePassword;

  DashboardBloc({
    GetAllPasswords getAllPasswords,
    AddPassword addPassword,
    UpdatePassword updatePassword,
    DeletePassword deletePassword,
  })  : _getAllPasswords = getAllPasswords,
        _addPassword = addPassword,
        _updatePassword = updatePassword,
        _deletePassword = deletePassword;

  List<Password> getAllPasswords() {
    final result = _getAllPasswords();
    return result.fold((l) => [], (r) => r);
  }

  void addPassword(Password password) {
    _addPassword(password);
  }

  void updatePassword(Password password) {
    _updatePassword(password);
  }

  void deletePassword(Password password) {
    _deletePassword(password);
  }
}

final dashboardBloc = GetIt.instance<DashboardBloc>();
