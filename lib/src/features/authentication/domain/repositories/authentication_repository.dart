import 'package:dartz/dartz.dart';
import 'package:flutter_tdd_architecture/src/core/error/failures.dart';
import 'package:flutter_tdd_architecture/src/features/authentication/domain/entities/user.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, User>> login({
    required String username,
    required String password,
  });
  Future<Either<Failure, User>> register({
    required String username,
    required String password,
    required String fullName,
  });
  Future<Either<Failure, User?>> getUserLocalData();
}
