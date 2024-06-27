import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:garcom_do_ta_na_mesa/my_app.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/presenter/store/get_user_store.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/home/repository/get_user_repository.dart';
import 'package:get_it/get_it.dart';
// import 'package:garcom_do_ta_na_mesa/src/modules/pushNotifications/service/firebase_messaging_service.dart';
// import 'package:garcom_do_ta_na_mesa/src/modules/pushNotifications/service/notification_service.dart';
// import 'package:provider/provider.dart';
import 'firebase_options.dart';

final GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  getIt.registerSingleton<GetUserStore>(
      GetUserStore(repository: GetUserRepositoryImpl()));
  runApp(
    // MultiProvider(
    // providers: [
    //   Provider<NotificationService>(create: (context) => NotificationService()),
    //   Provider<FirebaseMessagingService>(
    //       create: (context) =>
    //           FirebaseMessagingService(context.read<NotificationService>())),
    // ],
    // child:
    const MyApp(),
    // )
  );
}
