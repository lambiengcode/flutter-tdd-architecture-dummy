import 'package:flutter_tdd_architecture/src/features/authentication/domain/entities/user.dart';

class AuthenticationLocalData {
  final getStorage;
  final storageKeyToken = 'token';
  final storageKeyUser = 'user';

  AuthenticationLocalData({required this.getStorage});

  String getAccessToken() {
    return getStorage.read(storageKeyToken) ?? '';
  }

  User? getUserModel() {
    return getStorage.read(storageKeyUser) == null
        ? null
        : User.fromMap(
            getStorage.read(storageKeyUser),
          );
  }

  void saveAccessToken(String token) async {
    getStorage.write(storageKeyToken, token);
  }

  void saveUserModel(User userModel) async {
    getStorage.write(storageKeyUser, userModel.toMap());
  }

  void clearAccessToken() async {
    getStorage.remove(storageKeyToken);
  }

  void clearUserModel() async {
    getStorage.remove(storageKeyUser);
  }
}
