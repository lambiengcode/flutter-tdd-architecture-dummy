import 'package:dartz/dartz.dart';
import 'package:flutter_tdd_architecture/src/core/error/failures.dart';
import 'package:flutter_tdd_architecture/src/core/usecases/usecase.dart';
import 'package:flutter_tdd_architecture/src/features/authentication/domain/entities/user.dart';
import 'package:flutter_tdd_architecture/src/features/authentication/domain/repositories/authentication_repository.dart';

class LogOut implements UseCase<User, NoParams> {
  final AuthenticationRepository repository;

  LogOut({required this.repository});

  @override
  Future<Either<Failure, User?>> call(NoParams params) async {
    return await repository.logOut();
  }
}
