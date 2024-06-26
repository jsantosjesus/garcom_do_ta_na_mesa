import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:garcom_do_ta_na_mesa/src/modules/pushNotifications/service/notification_service.dart';

class FirebaseMessagingService {
  final NotificationService _notificationService;

  FirebaseMessagingService(this._notificationService);

  Future<void> initilize() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      badge: true,
      sound: true,
      alert: true,
    );

    _onMessage();
  }

  _onMessage() {
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        _notificationService.showNotification(CustomNotification(
            id: android.hashCode,
            title: notification.title!,
            body: notification.body!));
      }
    });
  }
}
