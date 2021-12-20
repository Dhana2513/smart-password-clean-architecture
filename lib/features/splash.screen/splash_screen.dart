import 'package:flutter/material.dart';
import 'package:smart_password_clean_architechture/features/dashboard/presentation/dashboard_screen.dart';
import 'package:splashscreen/splashscreen.dart' as splash;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 
  @override
  Widget build(BuildContext context) {
    return splash.SplashScreen(
      navigateAfterFuture: _checkIsUsedLoggedIn(),
      title: Text(
        'Welcome In SplashScreen',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      image: Image.network(
          'https://flutter.io/images/catalog-widget-placeholder.png'),
      backgroundColor: Colors.white,
      loaderColor: Colors.red,
    );
  }

  Future<bool> _checkIsUsedLoggedIn() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, DashBoardScreen.routeName);
    return true;
  }
}
