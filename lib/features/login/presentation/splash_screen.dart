import 'package:flutter/material.dart';
import 'package:smart_password_clean_architechture/features/login/presentation/bloc/login_bloc.dart';
import 'package:smart_password_clean_architechture/features/login/presentation/check_pattern_screen.dart';
import 'package:smart_password_clean_architechture/features/login/presentation/master_password_screen.dart';
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
        'Welcome In Smart Password',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      image: Image.network(
          'https://flutter.io/images/catalog-widget-placeholder.png'),
      backgroundColor: Colors.white,
      loaderColor: Colors.red,
    );
  }

  Future<bool> _checkIsUsedLoggedIn() async {
    await Future.delayed(Duration(seconds:1));
    final result = loginBloc.isMasterPasswordSet();
    if (result) {
      Navigator.pushReplacementNamed(context, CheckPatternScreen.routeName);
    } else {
      Navigator.pushReplacementNamed(context, MasterPasswordScreen.routeName);
    }
    return true;
  }
}
