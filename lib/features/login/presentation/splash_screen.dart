import 'package:flutter/material.dart';
import 'package:smart_password_clean_architechture/features/login/presentation/bloc/splash_bloc.dart';
import 'package:smart_password_clean_architechture/features/dashboard/presentation/dashboard_screen.dart';
import 'package:smart_password_clean_architechture/features/login/presentation/login_screen.dart';
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
    await Future.delayed(Duration(seconds: 5));
    final result = await splashBloc.checkPatter();
    print('result :  $result');
    if (result) {
      Navigator.pushReplacementNamed(context, DashBoardScreen.routeName);
      
    } else {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    }
    return true;
  }
}
