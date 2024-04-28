// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/services/get_message_firebase_token.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/services/prefs_service.dart';

class LogoutController {
  final GetMessageFirebaseToken _getMessageFirebaseToken =
      GetMessageFirebaseToken();

  Future<void> logout(String uid) async {
    await _getMessageFirebaseToken.setNullTokenMessage(uid);

    PrefsService.logout();
  }
}
