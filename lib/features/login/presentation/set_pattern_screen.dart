import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pattern_lock/pattern_lock.dart';
import 'package:smart_password_clean_architechture/features/login/presentation/bloc/login_bloc.dart';
import 'package:smart_password_clean_architechture/features/login/presentation/check_pattern_screen.dart';

class SetPatternScreen extends StatefulWidget {
  static const routeName = 'setPattern';
  @override
  _SetPatternScreenState createState() => _SetPatternScreenState();
}

class _SetPatternScreenState extends State<SetPatternScreen> {
  bool isConfirm = false;
  List<int> pattern;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Check Pattern")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Flexible(
            child: Text(
              isConfirm ? "Confirm pattern" : "Draw pattern",
              style: TextStyle(fontSize: 26),
            ),
          ),
          Flexible(
            child: PatternLock(
              selectedColor: Colors.amber,
              pointRadius: 12,
              onInputComplete: (List<int> input) {
                if (input.length < 3) {
                  // context.replaceSnackbar(
                  //   content: Text(
                  //     "At least 3 points required",
                  //     style: TextStyle(color: Colors.red),
                  //   ),
                  // );
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
                    // context.replaceSnackbar(
                    //   content: Text(
                    //     "Patterns do not match",
                    //     style: TextStyle(color: Colors.red),
                    //   ),
                    // );
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
