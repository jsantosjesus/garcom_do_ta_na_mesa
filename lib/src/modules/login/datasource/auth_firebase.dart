import 'package:firebase_auth/firebase_auth.dart';
import 'package:garcom_do_ta_na_mesa/src/utils/errors/error_exception.dart';

class AuthFirebase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> logarUsuario(
      {required String email, required String password}) async {
    String idUser;
    try {
      UserCredential usuarioAuth = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      idUser = usuarioAuth.user!.uid;

      return idUser;
    } on FirebaseAuthException catch (e) {
      throw DatasourceError(message: e.code);
    }
  }

  Future<void> logoutUsuario() {
    return _firebaseAuth.signOut();
  }
}
