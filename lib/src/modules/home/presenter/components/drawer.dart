import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/src/config_ui_global/config_ui_global.dart';

class MyDrawer extends StatelessWidget {
  final String nome;
  const MyDrawer({super.key, required this.nome});

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
            child: Text(
              'Olá $nome',
              style: const TextStyle(color: textColor01, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Chamados'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.table_bar),
            title: const Text('Mesas'),
            onTap: () {},
          ),
          // ListTile(
          //   leading: Icon(Icons.logout),
          //   title: Text('Logout'),
          //   onTap: () {
          //   },
          // ),
        ],
      ),
    );
  }
}
