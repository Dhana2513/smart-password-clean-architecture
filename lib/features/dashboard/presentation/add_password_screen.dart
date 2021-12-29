import 'package:flutter/material.dart';
import 'package:smart_password_clean_architechture/features/dashboard/constants/dashboard_constants.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/entities/password.dart';
import 'package:smart_password_clean_architechture/features/dashboard/presentation/bloc/dashboard_bloc.dart';

class AddPasswordScreen extends StatefulWidget {
  static const routeName = 'addPassword';

  const AddPasswordScreen({Key key}) : super(key: key);

  @override
  _AddPasswordScreenState createState() => _AddPasswordScreenState();
}

class _AddPasswordScreenState extends State<AddPasswordScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Password password;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      password = ModalRoute.of(context).settings.arguments as Password;
      if (password != null) {
        _initEditPassword();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DashBoardConstants.addPassword.titleAddPassword),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 16),
            TextField(
              controller: _descController,
              decoration: InputDecoration(
                hintText: 'Description',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Name',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _savePassword,
              child: Text('Save'),
            )
          ],
        ),
      ),
    );
  }

  void _initEditPassword() {
    _nameController.text = password.name;
    _descController.text = password.desc;
    _passwordController.text = password.password;
    setState(() {});
  }

  void _savePassword() {
    String name = _nameController.text.trim();
    String desc = _descController.text.trim();
    String passwd = _passwordController.text.trim();
    if (name.isEmpty || desc.isEmpty || passwd.isEmpty) return;
    if (password == null) {
      print('add password call');
      dashboardBloc.addPassword(Password(
        desc: desc,
        name: name,
        password: passwd,
      ));
    } else {
      print('update pass call ${password.dbKey}');
      password.name = name;
      password.desc = desc;
      password.password = passwd;

      dashboardBloc.updatePassword(password);
    }
    Navigator.of(context).pop(true);
  }
}
