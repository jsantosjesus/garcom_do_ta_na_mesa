import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/src_not_used/features/login/controller/notifier_user.dart';
// import 'package:garcom_do_ta_na_mesa/models/user.dart';
import 'package:garcom_do_ta_na_mesa/src_not_used/features/login/service/arthentication_service.dart';
import 'package:garcom_do_ta_na_mesa/src_not_used/features/login/states/login_state.dart';
import 'package:garcom_do_ta_na_mesa/src_not_used/models/user.dart';
// import 'package:garcom_do_ta_na_mesa/src/screens/utils/get_user_shared.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final usuario = NotifierUser();

  UserModel? user;
  // final AutheticationService _autheticationService = AutheticationService();

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
            onTap: () async {
              await AutheticationService().logoutUsuario();
              Navigator.of(context).pushNamed('/');
            },
          )
        ]),
      ),
      body: Column(children: [
        ValueListenableBuilder(
            valueListenable: usuario,
            builder: (_, state, child) {
              if (state is SucessLoginState) {
                return Text(state.usuario.nome);
              } else {
                return const Text('');
              }
            }),
        const Text(''),
        ElevatedButton(
            onPressed: () {
              usuario.fecthUser(
                  email: "jadsoonbol@gmail.com", password: "123Senh@");
            },
            child: const Text('data'))
      ]),
    );
  }
}
