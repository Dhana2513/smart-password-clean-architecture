import 'package:get_it/get_it.dart';
import 'package:smart_password_clean_architechture/core/bloc/bloc.dart';
import 'package:smart_password_clean_architechture/core/usecases/usecases.dart';
import 'package:smart_password_clean_architechture/features/login/domain/usecases/is_pattern_set.dart';

class SplashBloc {
  IsPatternSet _isPatternSet;

  final Bloc<bool> _isPatternSetBloc = Bloc();
  Stream<bool> get isPatternSetStream => _isPatternSetBloc.stream;

  SplashBloc({IsPatternSet isPatternSet}) : _isPatternSet = isPatternSet;

  checkPatter() async {
    final result = await _isPatternSet(NoParams());
    print('SplashBloc result $result');
  
    return result.fold((l) => false, (r) => true);
  }
}

final splashBloc = GetIt.instance<SplashBloc>();
