import 'package:flutter_tdd_architecture/src/features/authentication/data/datasources/authentication_local_data.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockSharedPreferences extends Mock implements GetStorage {}

void main() {
  AuthenticationLocalData? dataSource;
  MockSharedPreferences? mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = AuthenticationLocalData();
  });

  // group('getLastNumberTrivia', () {
  //   final tNumberTriviaModel =
  //       UserModel.fromJson(json.decode());

  //   test(
  //     'should return NumberTrivia from SharedPreferences when there is one in the cache',
  //     () async {
  //       // arrange
  //       when(mockSharedPreferences.getString(any))
  //           .thenReturn(fixture('trivia_cached.json'));
  //       // act
  //       final result = await dataSource.getLastNumberTrivia();
  //       // assert
  //       verify(mockSharedPreferences.getString(CACHED_NUMBER_TRIVIA));
  //       expect(result, equals(tNumberTriviaModel));
  //     },
  //   );

  //   test(
  //     'should throw a CacheExeption when there is not a cached value',
  //     () async {
  //       // arrange
  //       when(mockSharedPreferences.getString(any)).thenReturn(null);
  //       // act
  //       final call = dataSource.getLastNumberTrivia;
  //       // assert
  //       expect(() => call(), throwsA(TypeMatcher<CacheException>()));
  //     },
  //   );
  // });

  // group('cacheNumberTrivia', () {
  //   final tNumberTriviaModel =
  //       NumberTriviaModel(number: 1, text: 'test trivia');

  //   test(
  //     'should call SharedPreferences to cache the data',
  //     () async {
  //       // act
  //       dataSource.cacheNumberTrivia(tNumberTriviaModel);
  //       // assert
  //       final expectedJsonString = json.encode(tNumberTriviaModel.toJson());
  //       verify(mockSharedPreferences.setString(
  //         CACHED_NUMBER_TRIVIA,
  //         expectedJsonString,
  //       ));
  //     },
  //   );
  // });
}
