import 'package:dartz/dartz.dart';
import 'package:flutter_tdd_architecture/src/core/error/exceptions.dart';
import 'package:flutter_tdd_architecture/src/core/error/failures.dart';
import 'package:flutter_tdd_architecture/src/core/network/network.dart';
import 'package:flutter_tdd_architecture/src/features/authentication/data/datasources/authencation_remote_data.dart';
import 'package:flutter_tdd_architecture/src/features/authentication/data/datasources/authentication_local_data.dart';
import 'package:flutter_tdd_architecture/src/features/authentication/domain/entities/user.dart';
import 'package:flutter_tdd_architecture/src/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationLocalData localData;
  final AuthenticationRemoteData remoteData;
  final NetworkInfo networkInfo;

  AuthenticationRepositoryImpl({
    required this.networkInfo,
    required this.remoteData,
    required this.localData,
  });

  @override
  Future<Either<Failure, User?>> getUserLocalData() {
    return _getUserLocalData();
  }

  @override
  Future<Either<Failure, User>> register({
    required String username,
    required String password,
    required String fullName,
  }) async {
    return await _login(
      username: username,
      password: password,
    );
  }

  @override
  Future<Either<Failure, User>> login({
    required String username,
    required String password,
  }) async {
    return await _login(
      username: username,
      password: password,
    );
  }

  Future<Either<Failure, User>> _login({
    required String username,
    required String password,
  }) async {
    if (networkInfo.isConnected) {
      try {
        final remoteDataResponse = await remoteData.login(
          username: username,
          password: password,
        );
        if (remoteDataResponse != null) {
          localData.saveUserModel(remoteDataResponse);
          return Right(remoteDataResponse);
        } else {
          return Left(ServerFailure());
        }
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, User?>> _getUserLocalData() async {
    final localDataResponse = localData.getUserModel();
    return Right(localDataResponse);
  }
}
