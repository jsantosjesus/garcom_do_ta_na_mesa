import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/login/presenter/components/login_component.dart';
import 'package:garcom_do_ta_na_mesa/src/utils/components_ui_global/snack.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/login/repository/auth_repository.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/login/presenter/store/auth_store.dart';
import 'package:garcom_do_ta_na_mesa/src/utils/config_ui_global/config_ui_global.dart';
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
      backgroundColor: primaryColor,
      body: AnimatedBuilder(
        animation: Listenable.merge([
          store.initialState,
          store.isLoading,
          store.success,
          store.error,
        ]),
        builder: ((context, child) {
          if (store.initialState.value) {
            return Padding(
              padding: const EdgeInsets.only(top: 100, left: 70, right: 70),
              child: Image.asset('assets/image/ta_na_mesa_logo.png'),
            );
          } else if (store.isLoading.value) {
            return Container(
              color: primaryColor,
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

            return Container();
          } else {
            final uid = store.success.value;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.go('/home/$uid');
            });

            return Container();
          }
        }),
      ),
      bottomSheet: AnimatedBuilder(
        animation: store.initialState,
        builder: ((context, child) {
          if (store.initialState.value) {
            return Container(
              padding: const EdgeInsets.only(top: 50),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    // topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              height: 500,
              // color: Colors.white,
              child: Column(
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: primaryColor,
                        fontFamily: fontGlobal),
                  ),
                  const Text(
                    'app do garçom',
                    style: TextStyle(
                        color: Color(0xFF8F8E8E), fontFamily: fontGlobal),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  LoginComponent(
                    login: (String email, String password) {
                      store.login(email: email, password: password);
                    },
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox(
              height: 0,
              width: 0,
            );
          }
        }),
      ),
    );
  }
}
