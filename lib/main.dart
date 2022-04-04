import 'package:ajioapp/firebase_notification/firebase_not.dart';
import 'package:ajioapp/screens/loginScreen.dart';
import 'package:ajioapp/screens/productScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print("This is from background");
  print(message.notification!.title);
  print(message.notification!.body);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(
      (message) => backgroundHandler(message));
  var prefs = await SharedPreferences.getInstance();
  var email = prefs.getString("email");
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp(
    email: email,
  ));
}

class MyApp extends StatefulWidget {
  String? email;
  MyApp({required this.email});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//////////////////////////////////////
//   void listenNotifications() {
//     NotificationApi.onNotification.stream.listen(onClickedNotification);
//   }

// //////////////////////////////////
//   void onClickedNotification(String? payload) {
//     print("payload...${payload}");
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => ShowNotification(payload: payload.toString()),
//       ),
//     );
//   }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: widget.email == null ? LoginScreen() : ProductScreen(),
      home: FirebaseNotification1(),
    );
  }
}
