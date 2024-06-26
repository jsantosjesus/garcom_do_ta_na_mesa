import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:garcom_do_ta_na_mesa/src/features/home/logout/presenter/store/logout_store.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/services/storage_login/securit_storage_login.dart';
import 'package:go_router/go_router.dart';

class LogoutComponent extends StatefulWidget {
  final String uid;

  const LogoutComponent({super.key, required this.uid});

  @override
  State<LogoutComponent> createState() => _LogoutComponentState();
}

class _LogoutComponentState extends State<LogoutComponent> {
  final LogoutStore store = LogoutStore(storage: SecuritStorageLogin());

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([store.isLoading, store.isLoggedOut]),
      builder: ((context, child) {
        if (store.isLoading.value) {
          return const CircularProgressIndicator();
        } else if (!store.isLoggedOut.value) {
          return IconButton(
              onPressed: () {
                store.logout(uid: widget.uid);
              },
              icon: const Icon(Icons.exit_to_app));
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
