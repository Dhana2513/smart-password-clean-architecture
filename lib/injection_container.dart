import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smart_password_clean_architecture/core/utils/database_util.dart';
import 'package:smart_password_clean_architecture/features/dashboard/data/client/smart_password_client.dart';
import 'package:smart_password_clean_architecture/features/dashboard/data/datasource/local_datasource.dart';
import 'package:smart_password_clean_architecture/features/dashboard/data/datasource/local_datasource_protocol.dart';
import 'package:smart_password_clean_architecture/features/dashboard/data/repositories/repository.dart';
import 'package:smart_password_clean_architecture/features/dashboard/domain/entities/password.dart';
import 'package:smart_password_clean_architecture/features/dashboard/domain/repositories/repository_protocol.dart';
import 'package:smart_password_clean_architecture/features/dashboard/domain/use_cases/add_password.dart';
import 'package:smart_password_clean_architecture/features/dashboard/domain/use_cases/delete_password.dart';
import 'package:smart_password_clean_architecture/features/dashboard/domain/use_cases/get_all_passwords.dart';
import 'package:smart_password_clean_architecture/features/dashboard/domain/use_cases/update_password.dart';
import 'package:smart_password_clean_architecture/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:smart_password_clean_architecture/features/login/data/client/login_client.dart';
import 'package:smart_password_clean_architecture/features/login/data/datasource/login_local_datasource.dart';
import 'package:smart_password_clean_architecture/features/login/data/datasource/login_local_datasource_protocol.dart';
import 'package:smart_password_clean_architecture/features/login/data/repositories/login_repository.dart';
import 'package:smart_password_clean_architecture/features/login/domain/repositories/login_repository_protocol.dart';
import 'package:smart_password_clean_architecture/features/login/domain/use_cases/add_pattern.dart';
import 'package:smart_password_clean_architecture/features/login/domain/use_cases/check_master_password.dart';
import 'package:smart_password_clean_architecture/features/login/domain/use_cases/check_pattern.dart';
import 'package:smart_password_clean_architecture/features/login/domain/use_cases/is_master_password_set.dart';
import 'package:smart_password_clean_architecture/features/login/domain/use_cases/is_pattern_set.dart';
import 'package:smart_password_clean_architecture/features/login/domain/use_cases/set_master_password.dart';
import 'package:smart_password_clean_architecture/features/login/domain/use_cases/update_pattern.dart';
import 'package:smart_password_clean_architecture/features/login/presentation/bloc/login_state_handler.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // Hive
  await Hive.initFlutter();
  Hive.registerAdapter(PasswordAdapter());
  await DatabaseUtil.initDbUtil();

  serviceLocator.registerLazySingleton(() => DatabaseUtil.instance);

  _loginInit();
  _dashBoardInit();
}

_loginInit() {
  /// client
  serviceLocator.registerFactory(
    () => LoginClient(
      databaseUtil: serviceLocator(),
    ),
  );

  /// datasource
  serviceLocator.registerLazySingleton<LoginLocalDataSourceProtocol>(
    () => LoginLocalDataSource(
      client: serviceLocator(),
    ),
  );

  /// repository
  serviceLocator.registerLazySingleton<LoginRepositoryProtocol>(
    () => LoginRepository(
      dataSource: serviceLocator(),
    ),
  );

  ///use cases
  serviceLocator
      .registerLazySingleton(() => IsMasterPasswordSet(serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => SetMasterPassword(serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => CheckMasterPassword(serviceLocator()));

  serviceLocator.registerLazySingleton(() => IsPatternSet(serviceLocator()));
  serviceLocator.registerLazySingleton(() => AddPattern(serviceLocator()));
  serviceLocator.registerLazySingleton(() => CheckPattern(serviceLocator()));
  serviceLocator.registerLazySingleton(() => UpdatePattern(serviceLocator()));

  ///bloc
  serviceLocator.registerFactory(
    () => LoginBloc(
      isMasterPasswordSet: serviceLocator(),
      addPattern: serviceLocator(),
      checkPattern: serviceLocator(),
      isPatternSet: serviceLocator(),
      setMasterPassword: serviceLocator(),
      updatePattern: serviceLocator(),
      checkMasterPassword: serviceLocator(),
    ),
  );
}

_dashBoardInit() {
  /// client
  serviceLocator.registerLazySingleton<SmartPasswordClient>(
    () => SmartPasswordClient(
      databaseUtil: serviceLocator(),
    ),
  );

  /// repository
  serviceLocator.registerLazySingleton<RepositoryProtocol>(
    () => Repository(dataSource: serviceLocator()),
  );

  /// data sources
  serviceLocator.registerLazySingleton<LocalDataSourceProtocol>(
    () => LocalDataSource(client: serviceLocator()),
  );

  /// use cases
  serviceLocator.registerLazySingleton(() => GetAllPasswords(serviceLocator()));
  serviceLocator.registerLazySingleton(() => AddPassword(serviceLocator()));
  serviceLocator.registerLazySingleton(() => DeletePassword(serviceLocator()));
  serviceLocator.registerLazySingleton(() => UpdatePassword(serviceLocator()));

  /// bloc
  serviceLocator.registerFactory(
    () => DashboardBloc(
      getAllPasswords: serviceLocator(),
      addPassword: serviceLocator(),
      deletePassword: serviceLocator(),
      updatePassword: serviceLocator(),
    ),
  );
}
