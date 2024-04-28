// import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/browser.dart';
import 'package:timezone/data/latest.dart' as tz;

class CustomNotification {
  final int id;
  final String? title;
  final String? body;
  final String? payload;

  CustomNotification(
      {required this.id,
      required this.title,
      required this.body,
      required this.payload});
}

class NotificationService {
  late FlutterLocalNotificationsPlugin localNotificationsPlugin;

  late AndroidNotificationDetails androidDetails;

  NotificationService() {
    localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _setupNotifications();
  }

  _setupNotifications() async {
    await _setupTimezone();
  }

  Future<void> _setupTimezone() async {
    tz.initializeTimeZones();
    final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    setLocalLocation(getLocation(timeZoneName!));
  }

  _initializeNotifications() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    // Fazer: iOS
    await localNotificationsPlugin.initialize(
      const InitializationSettings(
        android: android,
      ),
    );
  }

  // _onSelectNotification(String? payload) {
  //   if (payload != null && payload.isNotEmpty) {
  //     // Navigator.of(RouteSettings().navigatorKey!.currentContext!).pushNamed(payload);
  //   }
  // }
}
