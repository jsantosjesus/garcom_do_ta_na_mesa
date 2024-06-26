// // import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // import 'package:flutter_native_timezone/flutter_native_timezone.dart';
// // import 'package:timezone/browser.dart';
// // import 'package:timezone/data/latest.dart' as tz;

class CustomNotification {
  final int id;
  final String? title;
  final String? body;
  // final String? payload;

  CustomNotification({
    required this.id,
    required this.title,
    required this.body,
    // required this.payload
  });
}

// class NotificationService {
//   late FlutterLocalNotificationsPlugin localNotificationsPlugin;

//   late AndroidNotificationDetails androidDetails;

//   NotificationService() {
//     localNotificationsPlugin = FlutterLocalNotificationsPlugin();
//     // _setupNotifications();
//   }

//   // _setupNotifications() async {
//   //   await _setupTimezone();
//   // }

//   // Future<void> _setupTimezone() async {
//   //   tz.initializeTimeZones();
//   //   final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
//   //   setLocalLocation(getLocation(timeZoneName!));
//   // }

//   _initializeNotifications() async {
//     const android = AndroidInitializationSettings('ta_na_mesa_logo');
//     // Fazer: iOS
//     await localNotificationsPlugin.initialize(
//       const InitializationSettings(
//         android: android,
//       ),
//     );
//   }

//   // _onSelectNotification(String? payload) {
//   //   if (payload != null && payload.isNotEmpty) {
//   //     // Navigator.of(RouteSettings().navigatorKey!.currentContext!).pushNamed(payload);
//   //   }
//   // }

//   showNotification(CustomNotification notification) {
//     androidDetails = const AndroidNotificationDetails(
//       'chamados_notifications_x',
//       'Chamados',
//       channelDescription: 'Ese canal é para chamados!',
//       importance: Importance.max,
//       priority: Priority.max,
//       enableVibration: true,
//     );

//     localNotificationsPlugin.show(
//       notification.id,
//       notification.title,
//       notification.body,
//       NotificationDetails(
//         android: androidDetails,
//       ),
//       payload: notification.payload,
//     );
//   }

//   // checkForNotifications() async {
//   //   final details =
//   //       await localNotificationsPlugin.getNotificationAppLaunchDetails();
//   //       if(details != null && details.didNotificationLaunchApp){
//   //         _onSelectNotification
//   //       }
//   // }
// }

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('ta_na_mesa_logo');

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});
  }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'Chamados',
            importance: Importance.max, priority: Priority.max),
        iOS: DarwinNotificationDetails());
  }

  Future showNotification(CustomNotification notification) async {
    return notificationsPlugin.show(notification.id, notification.title,
        notification.body, await notificationDetails());
  }
}
