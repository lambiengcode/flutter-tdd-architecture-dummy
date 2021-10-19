part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthenticationSuccess extends AuthState {
  final User? userModel;
  AuthenticationSuccess({this.userModel});
}

class AuthenticationFail extends AuthState {}

class Authenticating extends AuthState {}
