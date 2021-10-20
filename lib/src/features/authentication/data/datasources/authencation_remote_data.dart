import 'package:flutter_tdd_architecture/src/features/authentication/domain/entities/user.dart';

class AuthenticationRemoteData {
  Future<User?> login({
    required String username,
    required String password,
  }) async {
    return User(
      id: '1',
      username: 'lambiengcode',
      fullName: 'Dao Hong Vinh',
      age: 21,
    );
  }

  Future<User?> register({
    required String username,
    required String password,
    required String fullName,
  }) async {
    return User(
      id: '2',
      username: 'lambiengcode',
      fullName: 'Dao Hong Vinh',
      age: 18,
    );
  }
}
