import 'package:flutter_tdd_architecture/src/features/authentication/domain/entities/user.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationLocalData {
  final _getStorage = GetStorage();
  final storageKeyToken = 'token';
  final storageKeyUser = 'user';

  String getAccessToken() {
    return _getStorage.read(storageKeyToken) ?? '';
  }

  User? getUserModel() {
    return _getStorage.read(storageKeyUser) == null
        ? null
        : User.fromMap(
            _getStorage.read(storageKeyUser),
          );
  }

  void saveAccessToken(String token) async {
    _getStorage.write(storageKeyToken, token);
  }

  void saveUserModel(User userModel) async {
    _getStorage.write(storageKeyUser, userModel.toMap());
  }

  void clearAccessToken() async {
    _getStorage.remove(storageKeyToken);
  }

  void clearUserModel() async {
    _getStorage.remove(storageKeyUser);
  }
}
