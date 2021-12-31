import 'package:flutter/material.dart';
import 'package:pattern_lock/pattern_lock.dart';
import 'package:smart_password_clean_architechture/features/dashboard/presentation/dashboard_screen.dart';
import 'package:smart_password_clean_architechture/features/login/constants/login_constants.dart';
import 'package:smart_password_clean_architechture/features/login/presentation/bloc/login_state_handler.dart';

class CheckPatternScreen extends StatelessWidget {
  static const routeName = 'checkPattern';
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text(LoginConstants.checkPatternScreen.title),
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

  _onInputComplete(List<int> input) {
    if (loginBloc.checkPattern(input.toString())) {
      Navigator.of(globalKey.currentContext)
          .pushReplacementNamed(DashBoardScreen.routeName);
    } else {
      showSnackBar(LoginConstants.checkPatternScreen.errorTextWrongPattern);
    }
  }

  void showSnackBar(String text) {
    final snackBar = SnackBar(
      content: Text(text),
      duration: Duration(seconds: 1),
    );
    globalKey.currentState.showSnackBar(snackBar);
  }
}
