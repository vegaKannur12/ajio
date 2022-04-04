import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static void initialize() {
    final InitializationSettings initialiasationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings('@mipmap/ic_launcher'));

    notificationsPlugin.initialize(initialiasationSettings,
        onSelectNotification: (String? payload) {
      print(payload);
    });
  }

  ////////////////////////
  static void showNotificationOnforground(RemoteMessage message) {
    final notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails("com.example.ajioapp", "Ajioapp",
          importance: Importance.max, priority: Priority.high),
    );
    notificationsPlugin.show(
        DateTime.now().microsecond,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data["message"]);
  }
}
