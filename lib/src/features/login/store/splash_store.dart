import 'package:flutter/foundation.dart';
import 'package:garcom_do_ta_na_mesa/errors/error_exception.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/repository/auth_repository.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/services/storage_login/contract/login_params_model.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/services/storage_login/contract/storage_login.dart';

class SplashStore {
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(true);

  final ValueNotifier<bool> error = ValueNotifier<bool>(false);

  final ValueNotifier<String> success = ValueNotifier<String>('');

  final IStorageLogin storage;

  final IAuthRepository repository;

  SplashStore({required this.storage, required this.repository});

  Future autoLogin() async {
    try {
      final LoginParamsModel loginStorage = await storage.getEmailAndPassword();

      try {
        final result = await repository.auth(
            email: loginStorage.email, password: loginStorage.password);

        success.value = result;
      } on DatasourceError catch (e) {
        print(e.message);
        error.value = true;
      } catch (e) {
        error.value = true;
      }
    } catch (e) {
      error.value = true;
    }

    // print('chegou aqui 1');

    //   if (loginStorage.email.isNotEmpty & loginStorage.password.isNotEmpty) {

    //   } else {
    //     error.value = true;
    //     print('chegou aqui');
    //   }
    //   print('chegou aqui');
    isLoading.value = false;
  }
}
