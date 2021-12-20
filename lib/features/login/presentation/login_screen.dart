import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'loginScreen';
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text('Login'),
      ),
    );
  }
}
