part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class OnAuthCheck extends AuthEvent {}

class OnClear extends AuthEvent {}

class Login extends AuthEvent {}

class Register extends AuthEvent {}

class LogOut extends AuthEvent {}
