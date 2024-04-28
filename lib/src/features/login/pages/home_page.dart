// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:garcom_do_ta_na_mesa/src/features/chamados/controller/get_chamados_controller.dart';
// import 'package:garcom_do_ta_na_mesa/src/features/chamados/service/get_chamados_firebase_service.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/model/user_model.dart';
// import 'package:garcom_do_ta_na_mesa/src/controller/home_controller.dart';
// import 'package:garcom_do_ta_na_mesa/src/repository/home_repository_mock.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/services/prefs_service.dart';
// import 'package:garcom_do_ta_na_mesa/src/model/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel userModel =
      UserModel(uid: "", nome: "", estabelecimentoId: "", cargo: "");

  // final GetChamadosController _getChamadosController = GetChamadosController();

  @override
  void initState() {
    super.initState();
    Future.wait([
      PrefsService.user(),
    ]).then((value) {
      setState(() {
        userModel = UserModel.fromJson(value[0]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Central de Chamados"),
      ),
      drawer: Drawer(
        child: ListView(children: [
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {
              PrefsService.logout();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/login', (_) => true);
            },
          )
        ]),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('homePage'),
            Text(userModel.nome),
          ],
        ),
      ),

      // ValueListenableBuilder(
      //   valueListenable: _controller.chamados,
      //   builder: (_, list, __) {
      //     return ListView.builder(
      //         itemBuilder: (_, idx) => ListTile(
      //               title: Text(list[idx].tipo),
      //             ));
      //   },
      // ),
    );
  }
}
