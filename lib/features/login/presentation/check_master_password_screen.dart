import 'package:flutter/material.dart';
import 'package:smart_password_clean_architechture/core/assets.manager/assets_manager.dart';
import 'package:smart_password_clean_architechture/core/dialogs/alert_dialog.dart';
import 'package:smart_password_clean_architechture/features/login/constants/login_constants.dart';
import 'package:smart_password_clean_architechture/features/login/presentation/bloc/login_state_handler.dart';
import 'package:smart_password_clean_architechture/features/login/presentation/set_pattern_screen.dart';

class CheckMasterPasswordScreen extends StatefulWidget {
  static const routeName = 'checkMasterPasswordScreen';
  const CheckMasterPasswordScreen({Key key}) : super(key: key);

  @override
  _CheckMasterPasswordScreenState createState() =>
      _CheckMasterPasswordScreenState();
}

class _CheckMasterPasswordScreenState extends State<CheckMasterPasswordScreen> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LoginConstants.checkMasterPasswordScreen.title,
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
                AssetsManager.launcherIcon,
                height: 150,
                width: 150,
              ),
            ),
            SizedBox(height: 40),
            SizedBox(height: 24),
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText:
                    LoginConstants.masterPasswordScreen.labelTextMasterPassword,
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 24),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _navigateToSetPatternScreen,
                child: Text(
                    LoginConstants.checkMasterPasswordScreen.btnTextConfirm),
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
          ],
        ),
      ),
    );
  }

  void _navigateToSetPatternScreen() {
    String masterPassword = _textEditingController.text.trim();
    if (!loginBloc.checkMasterPassword(masterPassword)) {
      showAlertDialog(
        context,
        title: 'Info',
        subtitle:
            LoginConstants.masterPasswordScreen.errorTextPasswordDoseNotMatch,
        continueButtonText: 'Ok',
        continueCall: () {
          Navigator.of(context).pop();
        },
      );
      return;
    }
    Navigator.pushReplacementNamed(
      context,
      SetPatternScreen.routeName,
      arguments: masterPassword,
    );
  }
}
