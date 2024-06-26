import 'package:garcom_do_ta_na_mesa/src/modules/login/datasource/auth_firebase.dart';

abstract class IAuthRepository {
  Future<String> auth({required String email, required String password});
}

class AuthRepositoryImpl implements IAuthRepository {
  final AuthFirebase datasource = AuthFirebase();

  @override
  Future<String> auth({required String email, required String password}) async {
    final result = datasource.logarUsuario(email: email, password: password);

    return result;
  }
}
