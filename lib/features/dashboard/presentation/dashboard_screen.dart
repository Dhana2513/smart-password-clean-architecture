import 'package:flutter/material.dart';
import 'package:smart_password_clean_architechture/features/dashboard/constants/dashboard_constants.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/entities/password.dart';
import 'package:smart_password_clean_architechture/features/dashboard/presentation/add_password_screen.dart';
import 'package:smart_password_clean_architechture/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:smart_password_clean_architechture/features/dashboard/presentation/view.models/dashboard_viewmodel.dart';

class DashBoardScreen extends StatefulWidget {
  static const routeName = 'dashboardScreen';
  const DashBoardScreen({Key key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  DashBoardViewModel viewModel = DashBoardViewModel(dashboardBloc);
  @override
  void initState() {
    super.initState();
    viewModel.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DashBoardConstants.dashBoard.title),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: viewModel.lstPasswords.length,
          itemBuilder: (context, index) {
            Password password = viewModel.lstPasswords[index];
            return ListTile(
              onTap: () {
                print('edit password ${password.dbKey}');
                _callAddPasswordPage(password: password);
              },
              trailing: InkWell(
                onTap: () {
                  _deletePassword(password);
                },
                child: Icon(Icons.delete),
              ),
              title: Text(password.desc),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(password.name),
                    Text(password.password),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _callAddPasswordPage,
        child: Icon(Icons.add),
      ),
    );
  }

  void _callAddPasswordPage({Password password}) async {
    final result = await Navigator.of(context).pushNamed(
      AddPasswordScreen.routeName,
      arguments: password,
    );
    if (result) {
      viewModel.getData();
      setState(() {});
    }
  }

  void _deletePassword(Password password) {
    dashboardBloc.deletePassword(password);
    viewModel.getData();
    setState(() {});
  }
}
