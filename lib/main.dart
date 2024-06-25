import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:garcom_do_ta_na_mesa/my_app.dart';
import 'package:garcom_do_ta_na_mesa/src/features/pushNotifications/service/firebase_messaging_service.dart';
import 'package:garcom_do_ta_na_mesa/src/features/pushNotifications/service/notification_service.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      Provider<NotificationService>(create: (context) => NotificationService()),
      Provider<FirebaseMessagingService>(
          create: (context) =>
              FirebaseMessagingService(context.read<NotificationService>())),
    ],
    child: const MyApp(),
  ));
}
