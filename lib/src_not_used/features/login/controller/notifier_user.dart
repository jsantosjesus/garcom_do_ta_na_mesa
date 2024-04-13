// import 'package:flutter/material.dart';
// import 'package:garcom_do_ta_na_mesa/models/user.dart';

// class NotifierUser extends ChangeNotifier {
//   UserModel _user =
//       UserModel(uid: "", nome: "teste", estabelecimentoId: "", cargo: "");

//   // var _user;

//   get user => _user;

//   void setUser({required user}) {
//     _user = user;
//     notifyListeners();
//     // print(_user.nome);
//   }
// }

import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/src_not_used/features/login/service/arthentication_service.dart';
import 'package:garcom_do_ta_na_mesa/src_not_used/features/login/states/login_state.dart';

class NotifierUser extends ValueNotifier<LoginState> {
  final AutheticationService _autheticationService = AutheticationService();

  NotifierUser() : super(InitialLoginState());

  Future<LoginState> fecthUser(
      {required String email, required String password}) async {
    try {
      final usuario = await _autheticationService.logarUsuario(
          email: email, password: password);
      value = usuario;
      print(value);
      return value;
    } catch (e) {
      value = ErrorLoginState(message: "Erro ao fazer requisição");
      return value;
    }
  }
}
