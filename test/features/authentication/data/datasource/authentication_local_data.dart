import 'package:flutter_tdd_architecture/src/features/authentication/data/datasources/authentication_local_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mockito/mockito.dart';

class MockGetStorage extends Mock implements GetStorage {}

void main() {
  AuthenticationLocalData? authenticationLocalData;
  MockGetStorage? mockGetStorage;

  setUp(() {
    mockGetStorage = MockGetStorage();
    authenticationLocalData = AuthenticationLocalData(getStorage: mockGetStorage);
  });

  group('authentication_local_data_source', () {
    String testToken = 'testToken';

    test('save_access_token', () async {
      authenticationLocalData!.saveAccessToken(testToken);
      final result = authenticationLocalData!.getAccessToken();

      expect(result, testToken);
    });

    test('clear_access_token', () async {
      authenticationLocalData!.saveAccessToken(testToken);
      authenticationLocalData!.clearAccessToken();
      final result = authenticationLocalData!.getAccessToken();

      expect(result, null);
    });
  });
}
