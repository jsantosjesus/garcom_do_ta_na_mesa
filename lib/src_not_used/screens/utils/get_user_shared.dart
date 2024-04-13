import 'dart:convert';

import 'package:garcom_do_ta_na_mesa/src_not_used/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetUserShared {
  Future<UserModel?> loadUserFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user');
    if (userJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      return UserModel.fromMap(id: userMap['uid'], map: userMap);
    }
    return null; // Retornar null se o usuário não estiver no SharedPreferences
  }
}
