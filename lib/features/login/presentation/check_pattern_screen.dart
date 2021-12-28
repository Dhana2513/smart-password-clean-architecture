import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pattern_lock/pattern_lock.dart';
import 'package:smart_password_clean_architechture/features/dashboard/presentation/dashboard_screen.dart';
import 'package:smart_password_clean_architechture/features/login/presentation/bloc/login_bloc.dart';

class CheckPatternScreen extends StatelessWidget {
  static const routeName='checkPattern';

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Check Pattern"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Flexible(
            child: Text(
              "Draw Your pattern",
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
              onInputComplete: (List<int> input) {
                if (loginBloc.checkPattern(input.toString())) {
                  Navigator.of(context).pushReplacementNamed(DashBoardScreen.routeName);
                } else {
                  //  context.replaceSnackbar(
                  //   content: Text(
                  //     "wrong",
                  //     style: TextStyle(color: Colors.red),
                  //   ),
                  // );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}