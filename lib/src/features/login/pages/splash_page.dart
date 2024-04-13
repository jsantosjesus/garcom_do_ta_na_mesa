import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/services/prefs_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // Future.delayed(const Duration(seconds: 3))
    //     .then((value) => Navigator.of(context).pushReplacementNamed('/login'));

    Future.wait([
      PrefsService.isAuth(),
    ]).then((value) => value[0]
        ? Navigator.of(context).pushReplacementNamed('/home')
        : Navigator.of(context).pushReplacementNamed('/login'));
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
