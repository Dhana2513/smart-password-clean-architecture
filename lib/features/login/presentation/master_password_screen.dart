import 'package:flutter/material.dart';
import 'package:smart_password_clean_architecture/core/assets.manager/assets_manager.dart';
import 'package:smart_password_clean_architecture/core/dialogs/alert_dialog.dart';
import 'package:smart_password_clean_architecture/features/login/constants/login_constants.dart';
import 'package:smart_password_clean_architecture/features/login/presentation/set_pattern_screen.dart';

class MasterPasswordScreen extends StatefulWidget {
  static const routeName = 'masterPasswordScreen';
  const MasterPasswordScreen({Key key}) : super(key: key);

  @override
  _MasterPasswordScreenState createState() => _MasterPasswordScreenState();
}

class _MasterPasswordScreenState extends State<MasterPasswordScreen> {
  TextEditingController _masterPasswordController = TextEditingController();
  TextEditingController _confirmMasterPasswordController =
      TextEditingController();

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
        child: ListView(
          children: [
            SizedBox(height: 50),
            Center(
              child: Image.asset(
                AssetsManager.launcherIcon,
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
              controller: _masterPasswordController,
              decoration: InputDecoration(
                labelText:
                    LoginConstants.masterPasswordScreen.labelTextMasterPassword,
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 24),
            TextField(
              controller: _confirmMasterPasswordController,
              decoration: InputDecoration(
                labelText: LoginConstants
                    .masterPasswordScreen.lableTextConfirmMasterPassword,
                border: OutlineInputBorder(),
              ),
              obscureText: true,
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
    String masterPassword = _masterPasswordController.text.trim();
    if (!_validatePassword(masterPassword)) {
      return;
    }
    Navigator.pushReplacementNamed(
      context,
      SetPatternScreen.routeName,
      arguments: masterPassword,
    );
  }

  bool _validatePassword(String password) {
    if (_confirmMasterPasswordController.text.trim() != password) {
      _showAlert(
          LoginConstants.masterPasswordScreen.errorTextPasswordDoseNotMatch);
      return false;
    }
    if (password.isEmpty) {
      _showAlert(LoginConstants.masterPasswordScreen.errorTextBlankPassword);
      return false;
    }
    if (password.length < 8 || password.length > 16) {
      _showAlert(LoginConstants.masterPasswordScreen.errorTextPasswordLength);
      return false;
    }
    return true;
  }

  void _showAlert(String massage) {
    showAlertDialog(
      context,
      title: 'Info',
      subtitle: massage,
      continueButtonText: 'Ok',
      continueCall: () {
        Navigator.of(context).pop();
      },
    );
  }
}
