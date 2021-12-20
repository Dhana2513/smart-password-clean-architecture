class SmartPasswordConstants {
  static final dashBoard = _Dashboard.instance;
  static final login = _Login.instance;
}

class _Dashboard {
  _Dashboard._();
  static final instance = _Dashboard._();
  final title = 'Smart Password';
}

class _Login {
  _Login._();
  static final instance = _Login._();
  final title = 'Login';
}
