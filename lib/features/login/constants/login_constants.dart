class LoginConstants {
  static final masterPasswordScreen = _MasterPasswordScreen.instance;
  static final checkMasterPasswordScreen = _CheckMasterPasswordScreen.instance;
  static final patternScreen = _PatternScreen.instance;
  static final checkPatternScreen = _CheckPatternScreen.instance;
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
  final labelTextMasterPassword = 'Master password';
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
  final textDrawPattern = 'Draw pattern';
  final textConfirmPattern = 'Confirm pattern';
  final title = 'Set Pattern';
}

class _CheckPatternScreen {
  

  _CheckPatternScreen._();
  static final instance = _CheckPatternScreen._();
  final title = 'Check Pattern';
  final textDrawYourPattern = 'Draw Your pattern';
}
