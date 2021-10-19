import 'package:flutter_tdd_architecture/src/features/authentication/domain/entities/user.dart';

class AuthenticationRemoteData {
  Future<User?> login({
    required String username,
    required String password,
  }) async {
    return null;
  }

  Future<User?> register({
    required String username,
    required String password,
    required String fullName,
  }) async {
    return null;
  }
}
