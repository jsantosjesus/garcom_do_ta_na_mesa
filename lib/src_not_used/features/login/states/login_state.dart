import 'package:garcom_do_ta_na_mesa/src_not_used/models/user.dart';

abstract class LoginState {}

class InitialLoginState extends LoginState {}

class SucessLoginState extends LoginState {
  final UserModel usuario;

  SucessLoginState({required this.usuario});
}

class ErrorLoginState extends LoginState {
  final String message;

  ErrorLoginState({required this.message});
}
