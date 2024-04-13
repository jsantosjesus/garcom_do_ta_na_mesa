import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/model/user_model.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/services/auth_firebase_service.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/services/get_firestore_user_service.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/services/prefs_service.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/state/state_login.dart';
// import 'package:garcom_do_ta_na_mesa/src_not_used/models/user.dart';

class LoginController {
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  String? _email;
  setEmail(String value) => _email = value;

  String? _password;
  setPassword(String value) => _password = value;

  Future<LoginState> auth() async {
    if (_email == null || _email!.length < 5 || !_email!.contains("@")) {
      return ErrorLoginState(message: 'Email inválido');
    } else if (_password == null || _password!.length < 8) {
      return ErrorLoginState(message: 'senha inválida');
    } else {
      inLoader.value = true;
      final authFirebaseService = AuthFirebaseService();

      String? auth = await authFirebaseService.logarUsuario(
          email: _email!, password: _password!);

      if (auth != null) {
        final _firebaseUserService = GetFirestoreUserService();

        UserModel? usuario = await _firebaseUserService.getUserAuth(auth);

        if (usuario != null) {
          PrefsService.save(usuario);
          print(usuario);
          inLoader.value = false;
          return SucessLoginState();
        }
      }
      inLoader.value = false;
      return ErrorLoginState(message: 'Erro ao realizar login');
    }
  }
}
