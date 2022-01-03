import 'package:flutter/material.dart';
import 'package:pattern_lock/pattern_lock.dart';
import 'package:smart_password_clean_architecture/features/dashboard/presentation/dashboard_screen.dart';
import 'package:smart_password_clean_architecture/features/login/constants/login_constants.dart';
import 'package:smart_password_clean_architecture/features/login/presentation/bloc/login_state_handler.dart';
import 'package:smart_password_clean_architecture/features/login/presentation/check_master_password_screen.dart';

class CheckPatternScreen extends StatelessWidget {
  static const routeName = 'checkPattern';
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text(LoginConstants.checkPatternScreen.title),
        actions: _actions(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Flexible(
            child: Text(
              LoginConstants.checkPatternScreen.textDrawYourPattern,
              style: TextStyle(fontSize: 26),
            ),
          ),
          Flexible(
            child: PatternLock(
              selectedColor: Colors.red,
              pointRadius: 8,
              showInput: true,
              dimension: 3,
              relativePadding: 0.7,
              selectThreshold: 25,
              fillPoints: true,
              onInputComplete: _onInputComplete,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _actions(BuildContext context) {
    return [
      PopupMenuButton<String>(
        onSelected: (String val) {
          Navigator.of(context).pushNamed(CheckMasterPasswordScreen.routeName);
        },
        itemBuilder: (BuildContext context) {
          return {
            LoginConstants.checkPatternScreen.actionTextUnlockWithMasterPassword
          }.map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: Text(choice),
            );
          }).toList();
        },
      ),
    ];
  }

  _onInputComplete(List<int> input) {
    if (loginBloc.checkPattern(input.toString())) {
      Navigator.of(globalKey.currentContext)
          .pushReplacementNamed(DashBoardScreen.routeName);
    } else {
      _showSnackBar(LoginConstants.checkPatternScreen.errorTextWrongPattern);
    }
  }

  void _showSnackBar(String text) {
    final snackBar = SnackBar(
      content: Text(text),
      duration: Duration(seconds: 1),
    );
    globalKey.currentState.showSnackBar(snackBar);
  }
}
