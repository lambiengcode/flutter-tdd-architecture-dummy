part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class OnAuthCheck extends AuthEvent {}

class OnClearEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {}

class RegisterEvent extends AuthEvent {}

class LogOutEvent extends AuthEvent {}
