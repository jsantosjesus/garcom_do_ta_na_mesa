import 'package:flutter/foundation.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/login/services/get_message_firebase_token.dart';
import 'package:garcom_do_ta_na_mesa/src/utils/errors/error_exception.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/login/repository/auth_repository.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/login/services/storage_login/contract/login_params_model.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/login/services/storage_login/contract/storage_login.dart';

class LoginStore {
  final ValueNotifier<bool> initialState = ValueNotifier<bool>(true);

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<bool> error = ValueNotifier<bool>(false);

  final ValueNotifier<String> errorString = ValueNotifier<String>('');

  final ValueNotifier<String> success = ValueNotifier<String>('');

  final IStorageLogin storage;

  final IAuthRepository repository;

  final getMessageFirebaseToken = GetMessageFirebaseToken();

  LoginStore({required this.storage, required this.repository});

  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  bool isValidPassword(String password) {
    final RegExp passwordRegex =
        RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$');
    return passwordRegex.hasMatch(password);
  }

  Future autoLogin() async {
    isLoading.value = true;
    initialState.value = false;
    try {
      final LoginParamsModel loginStorage = await storage.getEmailAndPassword();

      try {
        final result = await repository.auth(
            email: loginStorage.email, password: loginStorage.password);

        success.value = result;
        // ignore: unused_catch_clause
      } on DatasourceError catch (e) {
        error.value = true;
      } catch (e) {
        error.value = true;
      }
    } catch (e) {
      error.value = true;
    }

    isLoading.value = false;
  }

  Future login({required String email, required String password}) async {
    initialState.value = false;
    if (!isValidEmail(email)) {
      errorString.value = 'Email inválido';
    } else if (!isValidPassword(password)) {
      errorString.value = 'Senha inválida';
    } else {
      isLoading.value = true;

      try {
        final result = await repository.auth(email: email, password: password);

        await getMessageFirebaseToken.getDeviceFirebaseToken(result);

        await storage.setEmailAndPassword(
            LoginParamsModel(email: email, password: password));

        success.value = result;
      } on DatasourceError catch (e) {
        if (e.message == 'invalid-credential') {
          errorString.value = 'email ou senha inválidos';
        } else {
          // print(e.message);
          errorString.value = 'Ops, aconteceu um erro';
        }
      } catch (e) {
        // print(e.toString());
        errorString.value = 'Ops, aconteceu um erro';
      }

      isLoading.value = false;
    }
  }
}
