import 'package:firebase_auth/firebase_auth.dart';
import 'package:garcom_do_ta_na_mesa/src_not_used/features/login/service/firebase_user_service.dart';
import 'package:garcom_do_ta_na_mesa/src_not_used/features/login/states/login_state.dart';

class AutheticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final FirebaseUserService _firebaseUserService = FirebaseUserService();

  Future<LoginState> logarUsuario(
      {required String email, required String password}) async {
    String idUser;
    try {
      UserCredential usuarioAuth = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      idUser = usuarioAuth.user!.uid;

      return _firebaseUserService.getUserAuth(idUser);
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-credential") {
        return ErrorLoginState(message: "e-mail ou senha inválidos");
      } else {
        return ErrorLoginState(message: 'Erro desconhecido');
      }
    }
  }

  Future<void> logoutUsuario() {
    return _firebaseAuth.signOut();
  }
}
