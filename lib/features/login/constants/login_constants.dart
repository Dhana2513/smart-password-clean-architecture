class LoginConstants {
  static final splashScreen = _SplashScreen.instance;
  static final masterPasswordScreen = _MasterPasswordScreen.instance;
  static final checkMasterPasswordScreen = _CheckMasterPasswordScreen.instance;
  static final patternScreen = _PatternScreen.instance;
  static final checkPatternScreen = _CheckPatternScreen.instance;
}

class _SplashScreen {
  _SplashScreen._();
  static final instance = _SplashScreen._();
  final title = 'Smart Password';
  final textWelcomeToSmartPassword = 'Welcome to Smart Password';
}

class _MasterPasswordScreen {
  _MasterPasswordScreen._();
  static final instance = _MasterPasswordScreen._();
  final title = 'Add Master Password';
  final textMasterPasswordInfo =
      'Master password will be used as uniqe key to encrypt your passwords';
  final btnTextSave = 'Save';
  final textMasterPasswordNote =
      'Note: Once master password set it can not be changed. \nIf you lose your master password then you will lose all your data';
  final labelTextMasterPassword = 'Master Password';
  final lableTextConfirmMasterPassword = 'Confirm Master Passowrd';
  final errorTextBlankPassword = 'Master password cannot be left blank';
  final errorTextPasswordLength =
      'Master password length should be between 8 - 16 characters';
  final errorTextPasswordDoseNotMatch = 'Master password does not match';
}

class _CheckMasterPasswordScreen {
  _CheckMasterPasswordScreen._();
  static final instance = _CheckMasterPasswordScreen._();
  final title = 'Confirm Master Password';
  final btnTextConfirm = 'Confirm';
}

class _PatternScreen {
  _PatternScreen._();
  static final instance = _PatternScreen._();
  final textDrawPattern = 'Draw Pattern';
  final textConfirmPattern = 'Confirm Pattern';
  final title = 'Set Pattern';
  final errorTextPatternLength = 'At least 3 points required';
  final errorTextPatternDoNotMatch = 'Patterns do not match';
}

class _CheckPatternScreen {
  _CheckPatternScreen._();
  static final instance = _CheckPatternScreen._();
  final title = 'Check Pattern';
  final textDrawYourPattern = 'Draw Your pattern';
  final errorTextWrongPattern = 'Wrong pattern';
}
