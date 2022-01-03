import 'package:flutter/material.dart';
import 'package:smart_password_clean_architecture/features/dashboard/presentation/add_password_screen.dart';
import 'package:smart_password_clean_architecture/features/dashboard/presentation/dashboard_screen.dart';
import 'package:smart_password_clean_architecture/features/login/presentation/check_master_password_screen.dart';
import 'package:smart_password_clean_architecture/features/login/presentation/check_pattern_screen.dart';
import 'package:smart_password_clean_architecture/features/login/presentation/master_password_screen.dart';
import 'package:smart_password_clean_architecture/features/login/presentation/set_pattern_screen.dart';
import 'package:smart_password_clean_architecture/features/login/presentation/splash_screen.dart';

import 'injecttion_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.amber,
        // primarySwatch: Colors.blueGrey,
        // primarySwatch: Colors.lightGreen,
        primarySwatch: Colors.lime,
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      routes: {
        CheckPatternScreen.routeName: (context) => CheckPatternScreen(),
        MasterPasswordScreen.routeName: (context) => MasterPasswordScreen(),
        SetPatternScreen.routeName: (context) => SetPatternScreen(),
        DashBoardScreen.routeName: (context) => DashBoardScreen(),
        AddPasswordScreen.routeName: (context) => AddPasswordScreen(),
        CheckMasterPasswordScreen.routeName: (context) =>
            CheckMasterPasswordScreen(),
      },
    );
  }
}
