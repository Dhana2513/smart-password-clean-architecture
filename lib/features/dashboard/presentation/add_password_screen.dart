import 'package:flutter/material.dart';
import 'package:smart_password_clean_architecture/features/dashboard/constants/dashboard_constants.dart';
import 'package:smart_password_clean_architecture/features/dashboard/domain/entities/password.dart';
import 'package:smart_password_clean_architecture/features/dashboard/presentation/bloc/dashboard_bloc.dart';

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
  bool isEditPassword = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      password = ModalRoute.of(context).settings.arguments as Password;
      isEditPassword = password != null;
      if (isEditPassword) {
        _initEditPassword();
      }
    });
  }

  void _initEditPassword() {
    _nameController.text = password.name;
    _descController.text = password.desc;
    _passwordController.text = password.password;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _addCredentialsCard,
          _backButton,
        ],
      ),
    );
  }

  Widget get _addCredentialsCard => Container(
        padding: EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.cyan[700],
              Colors.cyan[500],
              Colors.cyan[300],
              Colors.cyan[100],
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 0,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 32),
              Text(
                isEditPassword
                    ? DashBoardConstants.addPassword.textEditYourCredentials
                    : DashBoardConstants.addPassword.textSaveYourCredentials,
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: TextField(
                  controller: _descController,
                  decoration: InputDecoration(
                    labelText: DashBoardConstants.addPassword.hintTextTitle,
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: DashBoardConstants.addPassword.hintTextUsername,
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: DashBoardConstants.addPassword.hintPassword,
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
              SizedBox(height: 24),
              InkWell(
                onTap: _savePassword,
                child: Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    border: Border.all(
                      width: 0,
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Text(
                    DashBoardConstants.addPassword.btnTextSave,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );

  Widget get _backButton => Positioned(
        top: 0.0,
        left: 0.0,
        right: 0.0,
        child: AppBar(
          title: Text(''), // You can add title here
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0, //No shadow
        ),
      );

  void _savePassword() {
    String name = _nameController.text.trim();
    String desc = _descController.text.trim();
    String passwd = _passwordController.text.trim();

    if (name.isEmpty || desc.isEmpty || passwd.isEmpty) return;

    if (!isEditPassword) {
      dashboardBloc.addPassword(Password(
        desc: desc,
        name: name,
        password: passwd,
      ));
    } else {
      password.name = name;
      password.desc = desc;
      password.password = passwd;
      dashboardBloc.updatePassword(password);
    }
    Navigator.of(context).pop(true);
  }
}
