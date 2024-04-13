import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/controller/login_controller.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/pages/components/input_decoration.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/pages/components/snack.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/state/state_login.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  LoginController _controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ValueListenableBuilder<bool>(
        valueListenable: _controller.inLoader,
        builder: (_, inLoader, __) => inLoader == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFFFF881F),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        // controller: _emailController,
                        onChanged: _controller.setEmail,
                        decoration: getInputDecoration("E-mail"),
                      ),
                      TextFormField(
                        // controller: _passwordController,
                        onChanged: _controller.setPassword,
                        decoration: getInputDecoration("Senha"),
                        obscureText: true,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _controller.auth().then((result) {
                            if (result is SucessLoginState) {
                              Navigator.of(context)
                                  .pushReplacementNamed('/home');
                            } else {
                              showSnackBar(
                                  context: context,
                                  mesage: 'aconteceu um erro');
                            }
                          });
                        },
                        child: Text('Entrar'),
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFFF881F),
                            onPrimary: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
