
import 'package:get_it/get_it.dart';
import 'package:smart_password_clean_architechture/core/bloc/bloc.dart';
import 'package:smart_password_clean_architechture/features/domain/usecases/check_pattern.dart';

class SplashBloc {
   CheckPattern _checkPattern;

  final Bloc<bool> _checkPatternBloc = Bloc();
  Stream<bool> get checkPatternStream => _checkPatternBloc.stream;

  SplashBloc({CheckPattern checkPattern}) : _checkPattern = checkPattern;

  checkPatter(String pattern) async {
    final result = await _checkPattern(pattern);
    _checkPatternBloc.sink.add(result.fold((l) => false, (r) => true));
  }
}

final splashBloc = GetIt.instance<SplashBloc>();
