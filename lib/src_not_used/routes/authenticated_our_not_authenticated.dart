import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/src_not_used/features/login/controller/notifier_user.dart';
import 'package:garcom_do_ta_na_mesa/src_not_used/screens/home.dart';
import 'package:garcom_do_ta_na_mesa/src_not_used/screens/login.dart';
import 'package:garcom_do_ta_na_mesa/src_not_used/features/login/states/login_state.dart';

class LoginCheck extends StatefulWidget {
  const LoginCheck({super.key});

  @override
  State<LoginCheck> createState() => _LoginCheckState();
}

class _LoginCheckState extends State<LoginCheck> {
  NotifierUser usuario = NotifierUser();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ValueListenableBuilder(
            valueListenable: usuario,
            builder: (_, state, child) {
              if (state is SucessLoginState) {
                return Home();
              } else {
                return const Login();
              }
            }),
      ),
    );
  }
}
