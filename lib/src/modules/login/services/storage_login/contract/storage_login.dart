import 'package:garcom_do_ta_na_mesa/src/modules/login/services/storage_login/contract/login_params_model.dart';

abstract class IStorageLogin {
  Future setEmailAndPassword(LoginParamsModel loginParams);

  Future<LoginParamsModel> getEmailAndPassword();

  Future removeEmailAndPassword();
}
