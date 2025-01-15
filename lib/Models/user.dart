import 'dart:convert';

class User {
  final int id;
  final String username;
  final String password;
  final String token;

  User({
    required this.id,
    required this.username,
    required this.password,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'token': token,
    };
  }
}
