import 'package:ajioapp/firebase_notification/localNotification_cervice.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FirebaseNotification1 extends StatefulWidget {
  const FirebaseNotification1({Key? key}) : super(key: key);

  @override
  _FirebaseNotification1State createState() => _FirebaseNotification1State();
}

class _FirebaseNotification1State extends State<FirebaseNotification1> {
  String msg = "Waiting for msg";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LocalNotificationService.initialize();
    //////////////////////////////////////////////////////////////////
    FirebaseMessaging.onMessage.listen((event) {
      LocalNotificationService.showNotificationOnforground(event);
      setState(() {
        msg = "${event.notification!.title}-----I am from foreground";
      });
    });
    ///////////////////////////////////////////////////////////////////
    FirebaseMessaging.instance.getInitialMessage().then((event) {
      if (event != null) {
        setState(() {
          event.data[""];
          msg = "${event.notification!.title}-----I am from terminated state";
        });
      }
    });
    ///////////////////////////////////////////////////////////////////
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      setState(() {
        msg = "${event.notification!.title}-----I am from background";
      });
    });
  }
  ////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Notification"),
      ),
      body: Column(
        children: [
          Center(child: Text(msg)),
        ],
      ),
    );
  }
}
