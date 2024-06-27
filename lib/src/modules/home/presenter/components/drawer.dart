import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/src/utils/config_ui_global/config_ui_global.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/presenter/store/get_user_store.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class MyDrawer extends StatefulWidget {
  final String uid;
  const MyDrawer({super.key, required this.uid});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final GetUserStore userStore = GetIt.I<GetUserStore>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: const BoxDecoration(
                color: primaryColor,
              ),
              child: AnimatedBuilder(
                animation: Listenable.merge([
                  userStore.isLoading,
                  userStore.error,
                  userStore.success,
                ]),
                builder: ((context, child) {
                  if (userStore.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (userStore.error.value.isNotEmpty) {
                    return Center(
                      child: Text(userStore.error.value),
                    );
                  } else {
                    return Text(
                      'Olá ${userStore.success.value.nome}',
                      style: const TextStyle(color: textColor01, fontSize: 24),
                    );
                  }
                }),
              )),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Chamados'),
            onTap: () {
              context.go('/home/${widget.uid}');
            },
          ),
          ListTile(
            leading: const Icon(Icons.table_bar),
            title: const Text('Mesas'),
            onTap: () {
              context.go('/mesas/${widget.uid}');
            },
          ),
        ],
      ),
    );
  }
}
