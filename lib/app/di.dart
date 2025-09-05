import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../features/auth/data/datasources/auth_remote_data_source.dart';
import '../features/auth/data/datasources/impl/auth_remote_data_source_impl.dart';
import '../features/auth/data/repositories/auth_repository.dart';
import '../features/auth/data/repositories/impl/auth_repository_impl.dart';
import '../features/auth/domain/useCases/login_use_case.dart';
import '../features/auth/domain/useCases/logout_use_case.dart';
import '../features/auth/presentation/blocs/auth/auth_bloc.dart';

final getIt = GetIt.instance;

void setupDI() {
  // Network
  getIt.registerLazySingleton(() => Dio());

  // Data
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt()),
  );

  // Domain
  getIt.registerLazySingleton(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton(() => LogoutUseCase(getIt()));

  // Bloc
  getIt.registerFactory(() => AuthBloc(getIt(), getIt()));

  getIt.registerLazySingleton(() => GlobalKey<NavigatorState>());
}
