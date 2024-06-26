import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/services/storage_login/contract/login_params_model.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/services/storage_login/contract/storage_login.dart';

class SecuritStorageLogin implements IStorageLogin {
  final String _key = 'emailAndPasswordLogin';

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  @override
  Future<LoginParamsModel> getEmailAndPassword() async {
    final String? userStorage = await _secureStorage.read(key: _key);

    if (userStorage != null) {
      var mapUser = jsonDecode(userStorage);

      return LoginParamsModel(
          email: mapUser['email'], password: mapUser['password']);
    } else {
      throw Error();
    }
  }

  @override
  Future removeEmailAndPassword() async {
    await _secureStorage.delete(key: _key);
  }

  @override
  Future setEmailAndPassword(LoginParamsModel loginParams) async {
    await _secureStorage.write(
        key: _key,
        value: jsonEncode(
            {"email": loginParams.email, 'password': loginParams.password}));
  }
}
