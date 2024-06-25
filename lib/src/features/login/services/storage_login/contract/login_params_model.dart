// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginParamsModel {
  final String email;
  final String password;

  LoginParamsModel({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LoginParamsModel.fromMap(Map<String, dynamic> map) {
    return LoginParamsModel(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginParamsModel.fromJson(String source) =>
      LoginParamsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
