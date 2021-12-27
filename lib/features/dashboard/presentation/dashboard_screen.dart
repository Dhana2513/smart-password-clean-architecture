import 'package:flutter/material.dart';
import 'package:smart_password_clean_architechture/features/dashboard/constants/dashboard_constants.dart';
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
            return ListTile(
              title: Text(viewModel.lstPasswords[index].desc),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(viewModel.lstPasswords[index].name),
                    Text(viewModel.lstPasswords[index].password),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddPasswordScreen.routeName);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
