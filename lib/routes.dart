import 'package:garcom_do_ta_na_mesa/src/modules/conta/presenter/conta_page.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/presenter/home_page.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/login/presenter/login_page.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/login/presenter/splash_page.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/mesas/presenter/mesas_page.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const SplashPage(),
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: '/home',
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: '/mesas',
    builder: (context, state) => const MesasPage(),
  ),
  GoRoute(
    path: '/conta/:contaId/:mesaNumero/:mesaId',
    builder: (context, state) => ContaPage(
      contaId: state.pathParameters['contaId']!,
      mesaNumero: state.pathParameters['mesaNumero']!,
      mesaId: state.pathParameters['mesaId']!,
    ),
  )
]);
