import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/src/config_ui_global/config_ui_global.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/features_home/chamados/presenter/chamados_listview_component.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/presenter/components/drawer.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/features_home/logout/presenter/logout_component.dart';

class HomePage extends StatefulWidget {
  final String uid;
  const HomePage({super.key, required this.uid});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(nome: 'Jadson'),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: textColor01),
        centerTitle: true,
        backgroundColor: primaryColor,
        title: const Text(
          'Chamados',
          style: TextStyle(color: textColor01, fontWeight: FontWeight.bold),
        ),
        actions: [
          LogoutComponent(uid: widget.uid),
        ],
      ),
      body: const ChamadosListviewComponent(),
    );
  }
}
