import 'package:flutter/material.dart';
import 'package:smart_password_clean_architechture/features/dashboard/constants/dashboard_constants.dart';

class AddPasswordScreen extends StatefulWidget {
  static const routeName = 'addPassword';

  const AddPasswordScreen({Key key}) : super(key: key);

  @override
  _AddPasswordScreenState createState() => _AddPasswordScreenState();
}

class _AddPasswordScreenState extends State<AddPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DashBoardConstants.addPassword.titleAddPassword),
      ),
      body: Container(
        child: Text('Add Password Screen'),
      ),
    );
  }
}
