import 'dart:convert';

import 'package:garcom_do_ta_na_mesa/src/features/login/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  static final String _key = 'usuario';

  static save(UserModel user) async {
    var prefs = await SharedPreferences.getInstance();

    print(user);

    prefs.setString(
      _key,
      jsonEncode({"user": user.toJson(), 'isAuth': true}),
    );
  }

  static Future<bool> isAuth() async {
    var prefs = await SharedPreferences.getInstance();

    var jsonResult = prefs.getString(_key);

    if (jsonResult != null) {
      var mapUser = jsonDecode(jsonResult);

      return mapUser['isAuth'];
    }

    return false;
  }

  static Future user() async {
    var prefs = await SharedPreferences.getInstance();

    var jsonResult = prefs.getString(_key);

    if (jsonResult != null) {
      var mapUser = jsonDecode(jsonResult);

      return mapUser['user'];
    }

    return null;
  }

  static logout() async {
    var prefs = await SharedPreferences.getInstance();

    await prefs.remove(_key);
  }
}
