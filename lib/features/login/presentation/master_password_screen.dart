import 'package:flutter/material.dart';
import 'package:smart_password_clean_architechture/features/login/constants/login_constants.dart';
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
      appBar: AppBar(
        title: Text(
          LoginConstants.masterPasswordScreen.title,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100),
            Center(
              child: Image.asset(
                'assets/icons/ic_launcher.png',
                height: 150,
                width: 150,
              ),
            ),
            SizedBox(height: 40),
            Text(
              LoginConstants.masterPasswordScreen.textMasterPasswordInfo,
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 24),
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: LoginConstants.masterPasswordScreen.labelTextMasterPassword,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _setMasterPassword,
                child: Text(LoginConstants.masterPasswordScreen.btnTextSave),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(child: Container()),
            Text(
              LoginConstants.masterPasswordScreen.textMasterPasswordNote,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 50),
          ],
        ),
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
