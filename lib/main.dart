import 'package:flutter/material.dart';
import 'package:smart_password_clean_architechture/features/dashboard/presentation/add_password_screen.dart';
import 'package:smart_password_clean_architechture/features/login/presentation/check_pattern.dart';
import 'package:smart_password_clean_architechture/features/dashboard/presentation/dashboard_screen.dart';
import 'package:smart_password_clean_architechture/features/login/presentation/login_screen.dart';
import 'package:smart_password_clean_architechture/features/login/presentation/set_pattern.dart';

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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        DashBoardScreen.routeName: (context) => DashBoardScreen(),
        AddPasswordScreen.routeName: (context) => AddPasswordScreen(),
        "/check_pattern": (BuildContext context) => CheckPattern(),
        "/set_pattern": (BuildContext context) => SetPattern(),
      },
    );
  }
}
