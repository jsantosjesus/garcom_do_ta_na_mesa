import 'package:flutter/material.dart';

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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
                labelText: 'seu email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                )),
          ),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(
                labelText: 'sua senha',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                )),
          ),
          ElevatedButton(
            onPressed: () {
              widget.login(_emailController.text, _passwordController.text);
            },
            child: const Text('Entrar'),
          ),
        ],
      ),
    );
  }
}
