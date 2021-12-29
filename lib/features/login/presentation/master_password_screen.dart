import 'package:flutter/material.dart';
import 'package:smart_password_clean_architechture/features/login/presentation/set_pattern_screen.dart';

class MasterPasswordScreen extends StatefulWidget {
  static const routeName = 'masterPasswordScreen';
  const MasterPasswordScreen({Key key}) : super(key: key);

  @override
  _MasterPasswordScreenState createState() => _MasterPasswordScreenState();
}

class _MasterPasswordScreenState extends State<MasterPasswordScreen> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: _textEditingController,
          ),
          ElevatedButton(onPressed: _setMasterPassword, child: Text('Add'))
        ],
      ),
    );
  }

  void _setMasterPassword() {
    String masterPassword = _textEditingController.text.trim();
    Navigator.pushReplacementNamed(
      context,
      SetPatternScreen.routeName,
      arguments: masterPassword,
    );
  }
}
