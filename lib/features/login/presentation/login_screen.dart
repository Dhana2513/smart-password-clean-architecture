
import 'package:flutter/material.dart';
import 'package:smart_password_clean_architechture/core/utils/encryption_decryption_util.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'loginScreen';
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          TextField(
            controller: _textEditingController,
          ),
          ElevatedButton(onPressed: _encrypt, child: Text('encrpt')),
          ElevatedButton(onPressed: _decrypt, child: Text('decypt'))
        ],
      ),
    );
  }

  _encrypt() {
    String text = _textEditingController.text.trim();
    _textEditingController.text =
        EncryptionDecryptionUtil.getInstance().encrypt(text);
  }

  _decrypt() {
    String text = _textEditingController.text.trim();
    _textEditingController.text =
        EncryptionDecryptionUtil.getInstance().decrypt(text);
  }
}
