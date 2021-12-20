import 'package:flutter/material.dart';
import 'package:smart_password_clean_architechture/features/constants/smart_password_constants.dart';

class DashBoardScreen extends StatefulWidget {
  static const routeName = 'dashboardScreen';
  const DashBoardScreen({Key key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SmartPasswordConstants.dashBoard.title),
      ),
      body: Container(
        child: Text('DashBoard'),
      ),
    );
  }
}
