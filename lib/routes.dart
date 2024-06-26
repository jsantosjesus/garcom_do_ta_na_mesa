import 'package:garcom_do_ta_na_mesa/src/features/home/home_page.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/pages/login_page.dart';
import 'package:garcom_do_ta_na_mesa/src/features/login/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const SplashPage(),
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) => LoginPage(),
  ),
  GoRoute(
    path: '/home/:uid',
    builder: (context, state) => HomePage(
      uid: state.pathParameters['uid']!,
    ),
  )
]);
