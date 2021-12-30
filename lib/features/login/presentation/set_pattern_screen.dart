import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pattern_lock/pattern_lock.dart';
import 'package:smart_password_clean_architechture/features/login/constants/login_constants.dart';
import 'package:smart_password_clean_architechture/features/login/presentation/bloc/login_bloc.dart';
import 'package:smart_password_clean_architechture/features/login/presentation/check_pattern_screen.dart';

class SetPatternScreen extends StatefulWidget {
  static const routeName = 'setPattern';
  @override
  _SetPatternScreenState createState() => _SetPatternScreenState();
}

class _SetPatternScreenState extends State<SetPatternScreen> {
  final globalKey = GlobalKey<ScaffoldState>();

  bool isConfirm = false;
  List<int> pattern;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(title: Text(LoginConstants.patternScreen.title)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Flexible(
            child: Text(
              isConfirm
                  ? LoginConstants.patternScreen.textConfirmPattern
                  : LoginConstants.patternScreen.textDrawPattern,
              style: TextStyle(fontSize: 26),
            ),
          ),
          Flexible(
            child: PatternLock(
              selectedColor: Colors.amber,
              pointRadius: 12,
              onInputComplete: _onInputComplete,
            ),
          ),
        ],
      ),
    );
  }

  void _onInputComplete(List<int> input) {
    if (input.length < 3) {
      showSnackBar('At least 3 points required');
      return;
    }
    if (isConfirm) {
      if (listEquals<int>(input, pattern)) {
        loginBloc.addMasterPassword(
          ModalRoute.of(context).settings.arguments as String,
        );
        loginBloc.addPattern(pattern.toString());
        Navigator.of(context)
            .pushReplacementNamed(CheckPatternScreen.routeName);
      } else {
        showSnackBar('Patterns do not match');
        setState(() {
          pattern = null;
          isConfirm = false;
        });
      }
    } else {
      setState(() {
        pattern = input;
        isConfirm = true;
      });
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
