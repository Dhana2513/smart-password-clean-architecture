import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_password_clean_architechture/core/bloc/bloc.dart';
import 'package:smart_password_clean_architechture/core/usecases/usecases.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/entities/password.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/usecases/get_all_passwords.dart';

class DashboardBloc {
  final GettAllPasswords _gettAllPasswords;

  DashboardBloc({GettAllPasswords gettAllPasswords})
      : _gettAllPasswords = gettAllPasswords;

  Future<List<Password>> getAllPasswords() async {
    final result = await _gettAllPasswords(NoParams());
    return result.fold((l) => [], (r) => r);
  }
}

final dashboardBloc = GetIt.instance<DashboardBloc>();
