import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/login/presenter/store/splash_store.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/login/services/get_message_firebase_token.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/login/services/storage_login/contract/storage_login.dart';

class LogoutStore {
  final ValueNotifier<bool> isLoggedOut = ValueNotifier<bool>(false);

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final GetMessageFirebaseToken getMessageFirebaseToken =
      GetMessageFirebaseToken();

  final SplashStore loginStore = GetIt.I<SplashStore>();

  final IStorageLogin storage;

  LogoutStore({required this.storage});

  Future logout({required String uid}) async {
    isLoading.value = true;

    try {
      await getMessageFirebaseToken.setNullTokenMessage(uid);

      await storage.removeEmailAndPassword();

      // loginStore.error.value = false;
      loginStore.errorString.value = '';
      loginStore.initialState.value = true;
      loginStore.isLoading.value = false;
      loginStore.success.value = '';

      isLoggedOut.value = true;

      // ignore: empty_catches
    } catch (e) {}

    isLoading.value = false;
  }
}
