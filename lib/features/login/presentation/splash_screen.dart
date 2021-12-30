import 'package:flutter/material.dart';
import 'package:smart_password_clean_architechture/features/login/presentation/bloc/login_bloc.dart';
import 'package:smart_password_clean_architechture/features/login/presentation/check_pattern_screen.dart';
import 'package:smart_password_clean_architechture/features/login/presentation/master_password_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _checkIsUsedLoggedIn();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Password'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/icons/ic_launcher.png',
              height: 150,
              width: 150,
            ),
            SizedBox(height: 50),
            Text(
              'Welcome to Smart password',
              style: TextStyle(fontSize: 26),
            ),
            SizedBox(height: 50),
            CircularProgressIndicator(),
            SizedBox(height: 150),
          ],
        ),
      ),
    );
  }

  Future<bool> _checkIsUsedLoggedIn() async {
    final result = loginBloc.isMasterPasswordSet();
    if (result) {
      Navigator.pushReplacementNamed(context, CheckPatternScreen.routeName);
    } else {
      Navigator.pushReplacementNamed(context, MasterPasswordScreen.routeName);
    }
    return true;
  }
}
