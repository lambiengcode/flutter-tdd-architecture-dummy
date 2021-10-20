import 'package:flutter_tdd_architecture/src/core/network/network.dart';
import 'package:flutter_tdd_architecture/src/features/authentication/data/datasources/authencation_remote_data.dart';
import 'package:flutter_tdd_architecture/src/features/authentication/data/datasources/authentication_local_data.dart';
import 'package:flutter_tdd_architecture/src/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_tdd_architecture/src/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:flutter_tdd_architecture/src/features/authentication/domain/usecases/get_user_local_data.dart';
import 'package:flutter_tdd_architecture/src/features/authentication/domain/usecases/login.dart';
import 'package:flutter_tdd_architecture/src/features/authentication/domain/usecases/register.dart';
import 'package:flutter_tdd_architecture/src/features/authentication/presentation/bloc/auth/auth_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Register Bloc
  sl.registerFactory(
    () => AuthBloc(
      loginUsecase: sl(),
      registerUsecase: sl(),
      getUserLocalData: sl(),
    ),
  );

  // Register Usecases
  sl.registerLazySingleton(() => Login(repository: sl()));
  sl.registerLazySingleton(() => Register(repository: sl()));
  sl.registerLazySingleton(() => GetUserLocalData(repository: sl()));

  // Register Repository
  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      localData: sl(),
      networkInfo: sl(),
      remoteData: sl(),
    ),
  );

  // Data Source
  sl.registerLazySingleton<AuthenticationLocalData>(() => AuthenticationLocalData());

  sl.registerLazySingleton<AuthenticationRemoteData>(() => AuthenticationRemoteData());

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
}
