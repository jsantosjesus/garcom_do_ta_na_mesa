import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:garcom_do_ta_na_mesa/routes.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/pushNotifications/service/notification_service.dart';

class FirebaseMessagingService {
  final NotificationService _notificationService;

  FirebaseMessagingService(this._notificationService);

  Future<void> initialize() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      badge: true,
      sound: true,
      alert: true,
    );

    _configureFirebaseMessaging();
  }

  void _configureFirebaseMessaging() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      // AndroidNotification? android = message.notification?.android;

      if (notification != null) {
        _notificationService.showNotification(CustomNotification(
          id: message.messageId.hashCode,
          title: notification.title!,
          body: notification.body!,
        ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleNotificationTap();
    });
  }

  void _handleNotificationTap() {
    routes.go('/home');
  }
}
