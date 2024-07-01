import 'package:flutter/foundation.dart';
import 'package:garcom_do_ta_na_mesa/src/utils/errors/error_exception.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/model/user_model.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/repository/get_user_repository.dart';
import 'package:permission_handler/permission_handler.dart';

class GetUserStore {
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(true);

  final ValueNotifier<String> error = ValueNotifier<String>('');

  final ValueNotifier<UserModel> success =
      ValueNotifier<UserModel>(UserModel(uid: '', nome: ''));

  final IGetUserRepository repository;

  GetUserStore({required this.repository});

  Future getUser({required String uid}) async {
    try {
      final result = await repository.getUser(uid: uid);

      success.value = result;
    } on DatasourceError catch (e) {
      error.value = e.message;
    } catch (e) {
      error.value = 'Ops, ocorreu um erro';
    }

    isLoading.value = false;
  }

  Future<void> requestPermissionNotification() async {
    final bool permissionStatus = await Permission.notification.isGranted;

    if (!permissionStatus) {
      await Permission.notification.request();
    }
  }
}
