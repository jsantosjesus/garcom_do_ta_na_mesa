import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/login/presenter/components/login_component.dart';
import 'package:garcom_do_ta_na_mesa/src/components_ui_global/snack.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/login/repository/auth_repository.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/login/presenter/store/auth_store.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showSnackBar(
                  context: context,
                  mesage: store.error.value,
                  isError: true,
                );
                store.error.value = '';
                store.initialState.value = true;
              });

              return LoginComponent(
                login: (String email, String password) {
                  store.login(email: email, password: password);
                },
              );
            } else {
              final uid = store.success.value;
              WidgetsBinding.instance.addPostFrameCallback((_) {
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
