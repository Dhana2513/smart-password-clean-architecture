import 'package:flutter/material.dart';
import 'package:smart_password_clean_architechture/features/dashboard/presentation/dashboard_screen.dart';
import 'package:smart_password_clean_architechture/features/login/presentation/login_screen.dart';
import 'package:smart_password_clean_architechture/features/splash.screen/splash_screen.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        DashBoardScreen.routeName: (context) => DashBoardScreen(),
      },
    );
  }
}
