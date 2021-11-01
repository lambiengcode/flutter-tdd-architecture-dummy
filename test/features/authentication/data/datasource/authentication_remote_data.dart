import 'package:flutter_tdd_architecture/src/common/api_gateway.dart';
import 'package:flutter_tdd_architecture/src/common/constants.dart';
import 'package:flutter_tdd_architecture/src/features/authentication/data/datasources/authencation_remote_data.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:dio/dio.dart';

class MockDio extends Mock implements Dio {}

void main() {
  AuthenticationRemoteData? remoteData;
  MockDio? mockDioClient;

  setUp(() {
    mockDioClient = MockDio();
    remoteData = AuthenticationRemoteData();
  });

  void setUpMockDioClientSuccess200(String path) {
    when(mockDioClient!.post(path)).thenAnswer(
      (_) async => Response(
        statusCode: 200,
        requestOptions: RequestOptions(
          baseUrl: Constants.baseUrl,
          path: '',
          connectTimeout: 10000,
          receiveTimeout: 10000,
        ),
      ),
    );
  }

  void setUpMockDioClientFailure400(String path) {
    when(mockDioClient!.post(path)).thenAnswer(
      (_) async => Response(
        statusCode: 400,
        requestOptions: RequestOptions(
          baseUrl: Constants.baseUrl,
          path: path,
          connectTimeout: 10000,
          receiveTimeout: 10000,
        ),
      ),
    );
  }

  group('LOGIN - API', () {
    test(
      'should return login when the response code is 200 (success)',
      () async {
        // arrange
        setUpMockDioClientSuccess200(ApiGateway.LOGIN);

        // act
        final result = await remoteData!.logIn(
          username: 'lambiengcode@gmail.com',
          password: '123123',
        );
        // assert
        expect(result, isNotNull);
      },
    );

    test(
      'should return login when the response code is 400 (failure)',
      () async {
        // arrange
        setUpMockDioClientFailure400(ApiGateway.LOGIN);

        // act
        final result = await remoteData!.logIn(
          username: 'lambiengcode@gmail.com',
          password: '123456',
        );
        // assert
        expect(result, null);
      },
    );
  });

  group('REGISTER - API', () {
    test(
      'should return register when the response code is 200 (success)',
      () async {
        // arrange
        setUpMockDioClientSuccess200(ApiGateway.REGISTER);

        // act
        final result = await remoteData!.register(
          fullName: 'Dao Hong Vinh',
          username: 'lambiengcode@gmail.com',
          password: '123123',
        );
        // assert
        expect(result, isNotNull);
      },
    );

    test(
      'should return login when the response code is 400 (failure)',
      () async {
        // arrange
        setUpMockDioClientFailure400(ApiGateway.REGISTER);

        // act
        final result = await remoteData!.register(
          fullName: 'Dao Hong Vinh',
          username: 'lambiengcode@gmail.com',
          password: '123456',
        );
        // assert
        expect(result, null);
      },
    );
  });
}
