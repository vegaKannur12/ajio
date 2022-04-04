import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';


class NotificationApi {
  static final notifications = FlutterLocalNotificationsPlugin();
  static final onNotification = BehaviorSubject<String?>();

  //////////////////////////////////////////////////////////
  static Future notificationDetails() async {
    return NotificationDetails(
      android: AndroidNotificationDetails('Channel id', 'Channel name',
          // 'Channel description',
          importance: Importance.max),
      iOS: IOSNotificationDetails(),
    );
  }
  ///////////////////////////////////////////////////
   static Future init({
     bool initScheduled = false,

   })async{
     final android =AndroidInitializationSettings('@mipmap/ic_launcher');
     final ios =  IOSInitializationSettings();
     final settings = InitializationSettings(android: android,iOS: ios);
     
     await notifications.initialize(settings,onSelectNotification: (payload) async{
       onNotification.add(payload);
     },);
   }
   ////////////////////////////////////////////
  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    notifications.show(id, title, body, await notificationDetails());
  }
}
