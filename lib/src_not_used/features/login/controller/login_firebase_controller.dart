import 'package:garcom_do_ta_na_mesa/src_not_used/features/login/controller/notifier_user.dart';
// import 'package:garcom_do_ta_na_mesa/service/arthentication_service.dart';
import 'package:garcom_do_ta_na_mesa/src_not_used/features/login/states/login_state.dart';

class LoginFirebaseController {
  Future<LoginState> login(String email, String password) async {
    if (email.isEmpty || email.length < 5 || !email.contains("@")) {
      return ErrorLoginState(message: 'Email inválido');
    } else if (password.isEmpty || password.length < 8) {
      return ErrorLoginState(message: 'senha inválida');
    } else {
      final notifierUser = NotifierUser();
      return notifierUser.fecthUser(email: email, password: password);
    }
  }
}
