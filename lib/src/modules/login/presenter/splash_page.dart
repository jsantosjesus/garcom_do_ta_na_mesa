import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/login/repository/auth_repository.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/login/services/storage_login/securit_storage_login.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/login/presenter/store/splash_store.dart';
import 'package:go_router/go_router.dart';
// import 'package:garcom_do_ta_na_mesa/src/features/login/services/prefs_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashStore store = SplashStore(
      storage: SecuritStorageLogin(), repository: AuthRepositoryImpl());

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
    if (!store.isLoading.value) {
      WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
        if (mounted) {
          if (store.error.value) {
            context.go('/login');
          } else {
            final uid = store.success.value;
            context.go('/home/$uid');
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // return AnimatedBuilder(
    //   animation:
    //       Listenable.merge([store.isLoading, store.error, store.success]),
    //   builder: ((context, child) {
    //     if (store.isLoading.value) {
    return Container(
      color: const Color(0xFFFF881F),
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
    //     } else {
    //       return Container();
    //     }
    //   }),
    // );
  }
}
