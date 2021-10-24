import 'package:connectivity/connectivity.dart';
import 'package:flutter_tdd_architecture/src/core/network/network.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockDataConnectionChecker extends Mock implements Connectivity {}

void main() {
  NetworkInfoImpl? networkInfo;
  MockDataConnectionChecker? mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfo = NetworkInfoImpl(mockDataConnectionChecker!);
  });

  group('isConnected', () {
    test(
      'call to Connectivity().checkConnectivity()',
      () async {
        // arrange
        final tHasConnectionFuture = true;
        var connectivityResult = await (Connectivity().checkConnectivity());

        when(connectivityResult == ConnectivityResult.none).thenAnswer((_) => tHasConnectionFuture);
        // act
        final result = await networkInfo!.isConnected();
        // assert
        verify(mockDataConnectionChecker!.onConnectivityChanged);
        expect(result, tHasConnectionFuture);
      },
    );
  });
}
