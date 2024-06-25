import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/pages/components/login_component.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/repository/auth_repository.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/store/auth_store.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthStore store = AuthStore(repository: AuthRepositoryImpl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: Listenable.merge([
            store.initialState,
            store.isLoading,
            store.success,
            store.error,
          ]),
          builder: ((context, child) {
            if (store.initialState.value) {
              return LoginComponent(
                login: (String email, String password) {
                  store.login(email: email, password: password);
                },
              );
            } else if (store.isLoading.value) {
              return Container(
                color: const Color(0xFFFF881F),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              );
            } else if (store.error.value.isNotEmpty) {
              return LoginComponent(login: (String email, String password) {
                store.login(email: email, password: password);
              });
            } else {
              final uid = store.success.value;
              Future.delayed(Duration.zero, () {
                context.go('/home/$uid');
              });
              return Container();
            }
          }),
        ),
      ),
    );
  }
}
