import 'dart:convert';

import 'package:flutter_tdd_architecture/src/features/authentication/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../resources/fixture_reader.dart';

void main() {
  final tUserModel = UserModel(
    id: "lambiengcode",
    fullName: "Dao Hong Vinh",
    username: "lambiengcode",
    age: 21,
  );

  group('fromMap', () {
    test(
      'should return a valid User Model',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(fixture('user_model.json'));
        // act
        final result = UserModel.fromMap(jsonMap);
        // assert
        expect(result, tUserModel);
      },
    );
  });

  group('toMap', () {
    test(
      'should return a Json Map',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(fixture('user_model.json'));
        // act
        final result = tUserModel.toMap();
        // assert
        expect(result, jsonMap);
      },
    );
  });
}
