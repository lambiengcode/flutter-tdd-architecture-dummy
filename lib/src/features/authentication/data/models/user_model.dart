import 'dart:convert';

class UserModel {
  final String id;
  final String username;
  final String fullName;
  final int age;
  UserModel({
    required this.id,
    required this.username,
    required this.fullName,
    required this.age,
  });

  UserModel copyWith({
    String? id,
    String? username,
    String? fullName,
    int? age,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      fullName: fullName ?? this.fullName,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'fullName': fullName,
      'age': age,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      username: map['username'],
      fullName: map['fullName'],
      age: map['age'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, fullName: $fullName, age: $age)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.username == username &&
        other.fullName == fullName &&
        other.age == age;
  }

  @override
  int get hashCode {
    return id.hashCode ^ username.hashCode ^ fullName.hashCode ^ age.hashCode;
  }
}
