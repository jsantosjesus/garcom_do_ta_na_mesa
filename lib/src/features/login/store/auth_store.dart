import 'package:flutter/foundation.dart';
import 'package:garcom_do_ta_na_mesa/errors/error_exception.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/repository/auth_repository.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/services/get_message_firebase_token.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/services/storage_login/contract/login_params_model.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/services/storage_login/contract/storage_login.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/services/storage_login/securit_storage_login.dart';

class AuthStore {
  final ValueNotifier<bool> initialState = ValueNotifier<bool>(true);

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<String> error = ValueNotifier<String>('');

  final ValueNotifier<String> success = ValueNotifier<String>('');

  final IAuthRepository repository;

  final getMessageFirebaseToken = GetMessageFirebaseToken();

  final IStorageLogin storage = SecuritStorageLogin();

  AuthStore({required this.repository});

  Future login({required String email, required String password}) async {
    initialState.value = false;
    isLoading.value = true;
    error.value = '';

    try {
      final result = await repository.auth(email: email, password: password);

      await getMessageFirebaseToken.getDeviceFirebaseToken(result);

      await storage.setEmailAndPassword(
          LoginParamsModel(email: email, password: password));

      success.value = result;
    } on DatasourceError catch (e) {
      if (e.message == 'invalid-credential') {
        error.value = 'email ou senha inválidos';
      } else {
        print(e.message);
        error.value = 'Ops, aconteceu um erro';
      }
    } catch (e) {
      print(e.toString());
      error.value = 'Ops, aconteceu um erro';
    }

    isLoading.value = false;
  }
}
