import 'package:flutter/material.dart';
class ShowNotification extends StatefulWidget {
  String payload;
   ShowNotification({required this.payload});

  @override
  _ShowNotificationState createState() => _ShowNotificationState();
}

class _ShowNotificationState extends State<ShowNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("hai...........${widget.payload}"),
          ],
        ),
      ),
    );
  }
}