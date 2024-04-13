abstract class LoginState {}

class InitialLoginState extends LoginState {}

class SucessLoginState extends LoginState {
  SucessLoginState();
}

class ErrorLoginState extends LoginState {
  final String message;

  ErrorLoginState({required this.message});
}
