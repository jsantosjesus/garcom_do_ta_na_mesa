import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/src/utils/config_ui_global/config_ui_global.dart';

class LoginComponent extends StatefulWidget {
  final Function login;

  const LoginComponent({super.key, required this.login});

  @override
  State<LoginComponent> createState() => _LoginComponentState();
}

class _LoginComponentState extends State<LoginComponent> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Seu Email',
                labelStyle: TextStyle(fontFamily: fontGlobal),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: primaryColor),
                ),
                floatingLabelStyle:
                    TextStyle(color: primaryColor, fontFamily: fontGlobal),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: true,
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Sua Senha',
                labelStyle: TextStyle(fontFamily: fontGlobal),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: primaryColor),
                ),
                floatingLabelStyle:
                    TextStyle(color: primaryColor, fontFamily: fontGlobal),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  widget.login(_emailController.text, _passwordController.text);
                },
                child: const Text(
                  'Entrar',
                  style: TextStyle(
                      color: textColor01,
                      fontWeight: FontWeight.w700,
                      fontFamily: fontGlobal),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
