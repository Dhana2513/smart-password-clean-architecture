class DashBoardConstants {
  static final dashBoard = _Dashboard.instance;
  static final addPassword = _AddPassword.instance;
}

class _Dashboard {
  _Dashboard._();
  static final instance = _Dashboard._();

  final title = 'Smart Password';

  final actionTextChangePattern = 'Change pattern';
  final alertTitleDeletePassword = 'Delete Password!';
  final alertSubTitleDeletePassword =
      'Are you sure, you want to delete this password?';

  final noDataAvailableText =
      'There are no credentials available in your storage.\nPlease add credentials using add button.';
}

class _AddPassword {
  _AddPassword._();
  static final instance = _AddPassword._();

  final hintTextTitle = 'Title';
  final hintTextUsername = 'Username';
  final hintPassword = 'Password';

  final btnTextSave = 'Submit';

  final textSaveYourCredentials = 'Save Your Credentials';
  final textEditYourCredentials = 'Edit Your Credentials';
}
