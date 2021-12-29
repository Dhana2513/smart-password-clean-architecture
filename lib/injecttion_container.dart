import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smart_password_clean_architechture/core/utils/database_util.dart';
import 'package:smart_password_clean_architechture/features/dashboard/data/client/smart_password_client.dart';
import 'package:smart_password_clean_architechture/features/dashboard/data/datasource/local_datasource.dart';
import 'package:smart_password_clean_architechture/features/dashboard/data/datasource/local_datasource_protocol.dart';
import 'package:smart_password_clean_architechture/features/dashboard/data/repositories/repository.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/entities/password.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/repositories/repository_protocol.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/usecases/add_password.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/usecases/delete_password.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/usecases/get_all_passwords.dart';
import 'package:smart_password_clean_architechture/features/dashboard/domain/usecases/update_password.dart';
import 'package:smart_password_clean_architechture/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:smart_password_clean_architechture/features/login/data/client/login_client.dart';
import 'package:smart_password_clean_architechture/features/login/data/datasource/login_local_datasource.dart';
import 'package:smart_password_clean_architechture/features/login/data/datasource/login_local_datasource_protocol.dart';
import 'package:smart_password_clean_architechture/features/login/data/repositories/login_repository.dart';
import 'package:smart_password_clean_architechture/features/login/domain/repositories/login_repository_protocol.dart';
import 'package:smart_password_clean_architechture/features/login/domain/usecases/add_pattern.dart';
import 'package:smart_password_clean_architechture/features/login/domain/usecases/check_pattern.dart';
import 'package:smart_password_clean_architechture/features/login/domain/usecases/is_master_password_set.dart';
import 'package:smart_password_clean_architechture/features/login/domain/usecases/is_pattern_set.dart';
import 'package:smart_password_clean_architechture/features/login/domain/usecases/set_master_password.dart';
import 'package:smart_password_clean_architechture/features/login/domain/usecases/update_pattern.dart';
import 'package:smart_password_clean_architechture/features/login/presentation/bloc/login_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Hive
  await Hive.initFlutter();
  Hive.registerAdapter(PasswordAdapter());
  await DatabaseUtil.initDbUtil();

  sl.registerLazySingleton(() => DatabaseUtil.instance);

  _loginInit();
  _dashBoardInit();
}

_loginInit() {
  /// client
  sl.registerFactory(
    () => LoginClient(
      databaseUtil: sl(),
    ),
  );

  /// datasource
  sl.registerLazySingleton<LoginLocalDataSourceProtocol>(
    () => LoginLocalDataSource(
      client: sl(),
    ),
  );

  /// repository
  sl.registerLazySingleton<LoginRepositoryProtocol>(
    () => LoginRepository(
      dataSource: sl(),
    ),
  );

  ///use cases
  sl.registerLazySingleton(() => IsMasterPasswordSet(sl()));
  sl.registerLazySingleton(() => SetMasterPassword(sl()));

  sl.registerLazySingleton(() => IsPatternSet(sl()));
  sl.registerLazySingleton(() => AddPattern(sl()));
  sl.registerLazySingleton(() => CheckPattern(sl()));
  sl.registerLazySingleton(() => UpdatePattern(sl()));

  ///bloc
  sl.registerFactory(
    () => LoginBloc(
      isMasterPasswordSet: sl(),
      addPattern: sl(),
      checkPattern: sl(),
      isPatternSet: sl(),
      setMasterPassword: sl(),
      updatePattern: sl(),
    ),
  );
}

_dashBoardInit() {
  /// client
  sl.registerLazySingleton<SmartPasswordClient>(
    () => SmartPasswordClient(
      databaseUtil: sl(),
    ),
  );

  /// repository
  sl.registerLazySingleton<RepositoryProtocol>(
    () => Repository(dataSource: sl()),
  );

  /// data sources
  sl.registerLazySingleton<LocalDataSourceProtocol>(
    () => LocalDataSource(client: sl()),
  );

  /// use cases
  sl.registerLazySingleton(() => GettAllPasswords(sl()));
  sl.registerLazySingleton(() => AddPassword(sl()));
  sl.registerLazySingleton(() => DeletePassword(sl()));
  sl.registerLazySingleton(() => UpdatePassword(sl()));

  /// bloc
  sl.registerFactory(
    () => DashboardBloc(
      gettAllPasswords: sl(),
      addPassword: sl(),
      deletePassword: sl(),
      updatePassword: sl(),
    ),
  );
}
