import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_password_clean_architechture/features/data/client/smart_password_client.dart';
import 'package:smart_password_clean_architechture/features/data/datasource/local_datasource.dart';
import 'package:smart_password_clean_architechture/features/data/datasource/local_datasource_protocol.dart';
import 'package:smart_password_clean_architechture/features/data/repositories/repository.dart';
import 'package:smart_password_clean_architechture/features/domain/repositories/repository_protocol.dart';
import 'package:smart_password_clean_architechture/features/domain/usecases/add_password.dart';
import 'package:smart_password_clean_architechture/features/domain/usecases/add_pattern.dart';
import 'package:smart_password_clean_architechture/features/domain/usecases/check_pattern.dart';
import 'package:smart_password_clean_architechture/features/domain/usecases/delete_password.dart';
import 'package:smart_password_clean_architechture/features/domain/usecases/get_all_passwords.dart';
import 'package:smart_password_clean_architechture/features/domain/usecases/update_password.dart';
import 'package:smart_password_clean_architechture/features/presentation/bloc/dashboard_bloc.dart';
import 'package:smart_password_clean_architechture/features/presentation/bloc/login_bloc.dart';
import 'package:smart_password_clean_architechture/features/presentation/bloc/splash_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
 
  // Bloc
  sl.registerFactory(
    () => SplashBloc(
      checkPattern: sl(),
    ),
  );

  sl.registerFactory(
    () => LoginBloc(),
  );
  sl.registerFactory(
    () => DashboardBloc(),
  );

  // // Use cases
  sl.registerLazySingleton(() => GettAllPasswords(sl()));
  sl.registerLazySingleton(() => AddPassword(sl()));
  sl.registerLazySingleton(() => AddPattern(sl()));
  sl.registerLazySingleton(() => CheckPattern(sl()));
  sl.registerLazySingleton(() => DeletePassword(sl()));
  sl.registerLazySingleton(() => UpdatePassword(sl()));

  // Repository
  sl.registerLazySingleton<RepositoryProtocol>(
    () => Repository(dataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<LocalDataSourceProtocol>(
    () => LocalDataSource(client: sl()),
  );

  // Client
  sl.registerLazySingleton<SmartPasswordClient>(
    () => SmartPasswordClient(sharedPreferences: sl()),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
