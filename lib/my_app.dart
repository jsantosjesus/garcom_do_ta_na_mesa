import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/pages/home_page.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/pages/login_page.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/pages/splash_page.dart';
// import 'package:garcom_do_ta_na_mesa/src/routes/authenticated_our_not_authenticated.dart';
// import 'package:garcom_do_ta_na_mesa/src_not_used/screens/home.dart';
// import 'package:garcom_do_ta_na_mesa/src_not_used/screens/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF881F),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => const HomePage()
      },
      // home: const AuthenticatedOurNotAuthenticated(),
    );
  }
}
