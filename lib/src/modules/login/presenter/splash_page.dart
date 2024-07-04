import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/login/presenter/store/login_store.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final LoginStore store = GetIt.I<LoginStore>();

  @override
  void initState() {
    super.initState();

    store.autoLogin();

    store.isLoading.addListener(_navigate);
    store.success.addListener(_navigate);
    store.error.addListener(_navigate);
  }

  @override
  void dispose() {
    super.dispose();

    store.isLoading.removeListener(_navigate);
    store.error.removeListener(_navigate);
    store.success.removeListener(_navigate);
  }

  void _navigate() {
    if (!store.isLoading.value & !store.initialState.value) {
      WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
        if (mounted) {
          if (store.success.value.isNotEmpty) {
            context.go('/home');
          } else {
            context.go('/login');
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFF881F),
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
