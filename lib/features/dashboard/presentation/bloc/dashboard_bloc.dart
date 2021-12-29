import 'package:get_it/get_it.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/entities/password.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/usecases/add_password.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/usecases/delete_password.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/usecases/get_all_passwords.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/usecases/update_password.dart';

class DashboardBloc {
  final GettAllPasswords _gettAllPasswords;
  final UpdatePassword _updatePassword;
  final AddPassword _addPassword;
  final DeletePassword _deletePassword;

  DashboardBloc({
    GettAllPasswords gettAllPasswords,
    AddPassword addPassword,
    UpdatePassword updatePassword,
    DeletePassword deletePassword,
  })  : _gettAllPasswords = gettAllPasswords,
        _addPassword = addPassword,
        _updatePassword = updatePassword,
        _deletePassword = deletePassword;

  List<Password> getAllPasswords() {
    final result = _gettAllPasswords();
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
