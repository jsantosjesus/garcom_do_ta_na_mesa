import 'package:firebase_auth/firebase_auth.dart';
// import 'package:garcom_do_ta_na_mesa/src/services/get_firestore_user_service.dart';
// import 'package:garcom_do_ta_na_mesa/src_not_used/features/login/states/login_state.dart';

class AuthFirebaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> logarUsuario(
      {required String email, required String password}) async {
    String idUser;
    try {
      UserCredential usuarioAuth = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      idUser = usuarioAuth.user!.uid;

      return idUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-credential") {
        return null;
      } else {
        return null;
      }
    }
  }

  Future<void> logoutUsuario() {
    return _firebaseAuth.signOut();
  }
}
