import 'package:get_it/get_it.dart';
import 'package:smart_password_clean_architechture/features/login/domain/usecases/add_pattern.dart';
import 'package:smart_password_clean_architechture/features/login/domain/usecases/check_master_password.dart';
import 'package:smart_password_clean_architechture/features/login/domain/usecases/check_pattern.dart';
import 'package:smart_password_clean_architechture/features/login/domain/usecases/is_master_password_set.dart';
import 'package:smart_password_clean_architechture/features/login/domain/usecases/is_pattern_set.dart';
import 'package:smart_password_clean_architechture/features/login/domain/usecases/set_master_password.dart';
import 'package:smart_password_clean_architechture/features/login/domain/usecases/update_pattern.dart';

class LoginBloc {
  final IsMasterPasswordSet _isMasterPasswordSet;
  final IsPatternSet _isPatternSet;
  final AddPattern _addPattern;
  final CheckPattern _checkPattern;
  final SetMasterPassword _setMasterPassword;
  final UpdatePattern _updatePattern;
  final CheckMasterPassword _checkMasterPassword;

  LoginBloc({
    IsMasterPasswordSet isMasterPasswordSet,
    IsPatternSet isPatternSet,
    AddPattern addPattern,
    CheckPattern checkPattern,
    SetMasterPassword setMasterPassword,
    UpdatePattern updatePattern,
    CheckMasterPassword checkMasterPassword,
  })  : _isMasterPasswordSet = isMasterPasswordSet,
        _isPatternSet = isPatternSet,
        _addPattern = addPattern,
        _checkPattern = checkPattern,
        _setMasterPassword = setMasterPassword,
        _updatePattern = updatePattern,
        _checkMasterPassword = checkMasterPassword;

  bool isMasterPasswordSet() {
    return _isMasterPasswordSet().fold((l) => false, (r) => r);
  }

  bool isPatternSet() {
    return _isPatternSet().fold((l) => false, (r) => r);
  }

  bool checkPattern(String pattern) {
    return _checkPattern(pattern).fold((l) => false, (r) => r);
  }

  void addPattern(String pattern) {
    _addPattern(pattern);
  }

  void updatePattern(String pattern) {
    _updatePattern(pattern);
  }

  void addMasterPassword(String masterPassword) {
    _setMasterPassword(masterPassword);
  }

   bool checkMasterPassword(String masterPassword) {
    return _checkMasterPassword(masterPassword).fold((l) => false, (r) => r);
  }
}

final loginBloc = GetIt.instance<LoginBloc>();
