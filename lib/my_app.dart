import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/routes.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/pushNotifications/service/firebase_messaging_service.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/pushNotifications/service/notification_service.dart';
import 'package:get_it/get_it.dart';
// import 'package:garcom_do_ta_na_mesa/src/modules/pushNotifications/service/firebase_messaging_service.dart';
// import 'package:garcom_do_ta_na_mesa/src/modules/pushNotifications/service/notification_service.dart';
// import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final NotificationService _notificationService =
      GetIt.I<NotificationService>();
  final FirebaseMessagingService _firebaseMessagingService =
      GetIt.I<FirebaseMessagingService>();

  @override
  void initState() {
    super.initState();
    initializeFirebaseMessaging();
    checkNotifications();
  }

  initializeFirebaseMessaging() async {
    await _firebaseMessagingService.initialize();
  }

  checkNotifications() async {
    await _notificationService.initNotification();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF881F),
        ),
        useMaterial3: true,
      ),
      home: MaterialApp.router(
        routerConfig: routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
