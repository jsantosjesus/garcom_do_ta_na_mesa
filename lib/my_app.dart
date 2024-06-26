import 'package:flutter/material.dart';
import 'package:garcom_do_ta_na_mesa/routes.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/pushNotifications/service/firebase_messaging_service.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/pushNotifications/service/notification_service.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initializeFirebaseMessaging();
    checkNotifications();
  }

  initializeFirebaseMessaging() async {
    await Provider.of<FirebaseMessagingService>(context, listen: false)
        .initilize();
  }

  checkNotifications() async {
    await Provider.of<NotificationService>(context, listen: false)
        .initNotification();
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
