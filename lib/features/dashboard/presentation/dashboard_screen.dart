import 'package:flutter/material.dart';
import 'package:smart_password_clean_architecture/core/dialogs/alert_dialog.dart';
import 'package:smart_password_clean_architecture/features/dashboard/constants/dashboard_constants.dart';
import 'package:smart_password_clean_architecture/features/dashboard/domain/entities/password.dart';
import 'package:smart_password_clean_architecture/features/dashboard/presentation/add_password_screen.dart';
import 'package:smart_password_clean_architecture/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:smart_password_clean_architecture/features/dashboard/presentation/view.models/dashboard_viewmodel.dart';
import 'package:smart_password_clean_architecture/features/login/presentation/check_master_password_screen.dart';

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
        actions: _actions(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(.0),
        child: ListView.separated(
          itemCount: viewModel.lstPasswords.length,
          itemBuilder: _passwordsListItemBuilder,
          separatorBuilder: (context, index) {
            return Container(
              height: 0.8,
              color: Colors.grey[300],
            );
          },
        ),
      ),
      backgroundColor: Colors.grey[100],
      floatingActionButton: FloatingActionButton(
        onPressed: _callAddPasswordPage,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _passwordsListItemBuilder(context, index) {
    Password password = viewModel.lstPasswords[index];

    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  password.desc,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  password.name,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Colors.black54,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  password.password,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Colors.black54,
                      ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                onTap: () {
                  _callAddPasswordPage(password: password);
                },
                child: Icon(
                  Icons.edit,
                  color: Colors.black45,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () {
                  _deletePassword(password);
                },
                child: Icon(
                  Icons.delete,
                  color: Colors.black26,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _actions() {
    return [
      PopupMenuButton<String>(
        onSelected: handleClick,
        itemBuilder: (BuildContext context) {
          return {'Change pattern'}.map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: Text(choice),
            );
          }).toList();
        },
      ),
    ];
  }

  void handleClick(String value) {
    Navigator.of(context).pushNamed(CheckMasterPasswordScreen.routeName);
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
    showAlertDialog(
      context,
      title: 'Delete Password!',
      subtitle: 'Are you sure, you want to delete this password?',
      cancelButtonText: 'Cancel',
      cancelCall: () {
        Navigator.of(context).pop();
      },
      continueButtonText: 'Delete',
      continueCall: () {
        dashboardBloc.deletePassword(password);
        viewModel.getData();
        setState(() {});
      },
    );
  }
}
