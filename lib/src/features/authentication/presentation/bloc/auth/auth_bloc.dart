import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
      await _login();
      yield AuthenticationSuccess(
        userModel: user,
      );
    }
  }

  Future<void> _login() async {
    user = User(
      id: '1234',
      username: 'lambiengcode',
      fullName: 'Dao Hong Vinh',
      age: 18,
    );
  }
}
