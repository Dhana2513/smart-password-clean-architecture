
import 'package:smart_password_clean_architechture/features/dashboard/domain/entities/password.dart';
import 'package:smart_password_clean_architechture/features/dashboard/presentation/bloc/dashboard_bloc.dart';

class DashBoardViewModel {
  final DashboardBloc bloc;
  DashBoardViewModel(this.bloc);

  List<Password> lstPasswords = [];
  getData()  {
    lstPasswords =  bloc.getAllPasswords();
  }
}
