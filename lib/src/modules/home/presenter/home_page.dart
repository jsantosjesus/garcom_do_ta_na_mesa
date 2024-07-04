import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/login/presenter/store/splash_store.dart';
import 'package:garcom_do_ta_na_mesa/src/utils/config_ui_global/config_ui_global.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/features_home/chamados/get_chamados/presenter/chamados_listview_component.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/presenter/components/drawer.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/features_home/logout/presenter/logout_component.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/presenter/store/get_user_store.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  // final String uid;
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GetUserStore userStore = GetIt.I<GetUserStore>();
  final SplashStore userUidStore = GetIt.I<SplashStore>();

  @override
  void initState() {
    super.initState();

    userStore.getUser(uid: userUidStore.success.value);
    userStore.requestPermissionNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: textColor01),
        centerTitle: true,
        backgroundColor: primaryColor,
        title: const Text(
          'Chamados',
          style: TextStyle(
              color: textColor01,
              fontWeight: FontWeight.w900,
              fontFamily: fontGlobal),
        ),
        actions: const [
          LogoutComponent(),
        ],
      ),
      body: ChamadosListviewComponent(uid: userUidStore.success.value),
    );
  }
}
