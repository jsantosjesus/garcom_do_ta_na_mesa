import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/login/presenter/store/login_store.dart';
import 'package:garcom_do_ta_na_mesa/src/utils/config_ui_global/config_ui_global.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/features_home/logout/presenter/store/logout_store.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/login/services/storage_login/securit_storage_login.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';

class LogoutComponent extends StatefulWidget {
  // final String uid;

  const LogoutComponent({super.key});

  @override
  State<LogoutComponent> createState() => _LogoutComponentState();
}

class _LogoutComponentState extends State<LogoutComponent> {
  final LogoutStore store = LogoutStore(storage: SecuritStorageLogin());

  final LoginStore userUidStore = GetIt.I<LoginStore>();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([store.isLoading, store.isLoggedOut]),
      builder: ((context, child) {
        if (store.isLoading.value) {
          return const CircularProgressIndicator(
            color: textColor01,
          );
        } else if (!store.isLoggedOut.value) {
          return IconButton(
            onPressed: () {
              store.logout(uid: userUidStore.success.value);
            },
            icon: const Icon(Icons.exit_to_app),
            // color: textColor01,
          );
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.go('/');
          });

          return Container();
        }
      }),
    );
  }
}
