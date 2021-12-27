class DashBoardConstants {
  static final dashBoard = _Dashboard.instance;
  static final addPassword = _AddPassword.instance;
}

class _Dashboard {
  _Dashboard._();
  static final instance = _Dashboard._();
  final title = 'Smart Password';
}

class _AddPassword {
  _AddPassword._();
  static final instance = _AddPassword._();
  final titleAddPassword = 'Add Password';
  final updateAddPassword = 'Update Password';
}
