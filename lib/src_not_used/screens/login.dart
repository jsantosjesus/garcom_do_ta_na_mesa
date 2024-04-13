import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/src_not_used/features/login/controller/login_firebase_controller.dart';
// import 'package:garcom_do_ta_na_mesa/src/features/login/controller/notifier_user.dart';
import 'package:garcom_do_ta_na_mesa/src_not_used/features/login/states/login_state.dart';
import 'package:garcom_do_ta_na_mesa/src_not_used/screens/components/decoration_input.dart';
import 'package:garcom_do_ta_na_mesa/src_not_used/screens/components/snackBar.dart';
// import 'package:garcom_do_ta_na_mesa/screens/components/snackBar.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final LoginFirebaseController _loginFirebaseController =
      LoginFirebaseController();
  // late NotifierUser _notifierUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: getAuthenticationInputDecoration("E-mail"),
              ),
              TextFormField(
                controller: _passwordController,
                decoration: getAuthenticationInputDecoration("Senha"),
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () async {
                  await clickLogin();
                },
                child: Text('Entrar'),
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFFF881F), onPrimary: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  clickLogin() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    // final result = await _loginFirebaseController.login(email, password);

    final result = await _loginFirebaseController.login(email, password);

    if (result is ErrorLoginState) {
      showSnackBar(context: context, mesage: result.message);
    } else if (result is SucessLoginState) {
      Navigator.of(context).pushNamed('/home');
    }
  }
}
