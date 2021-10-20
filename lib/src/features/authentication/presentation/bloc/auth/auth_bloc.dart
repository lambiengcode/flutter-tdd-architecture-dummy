import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tdd_architecture/src/core/error/failures.dart';
import 'package:flutter_tdd_architecture/src/features/authentication/domain/entities/user.dart';
import 'package:flutter_tdd_architecture/src/features/authentication/domain/usecases/login.dart';
import 'package:flutter_tdd_architecture/src/features/authentication/domain/usecases/register.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.loginUsecase,
    required this.registerUsecase,
  }) : super(Authenticating());

  final Login loginUsecase;
  final Register registerUsecase;
  User? user;

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is OnAuthCheck) {
      yield Authenticating();
      yield AuthenticationSuccess(userModel: user);
    }

    if (event is LoginEvent) {
      yield Authenticating();
      yield* _login();
    }
  }

  Stream<AuthState> _login() async* {
    Either<Failure, User?> userResponse = await loginUsecase.call(
      ParamsLogin(username: '', password: ''),
    );
    yield userResponse.fold(
      (failure) => AuthenticationFail(),
      (user) => AuthenticationSuccess(userModel: user),
    );
  }
}
