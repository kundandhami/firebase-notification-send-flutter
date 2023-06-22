import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NavigatorPage extends StatefulWidget {
  RemoteMessage? message;
  NavigatorPage({Key? key, this.message}) : super(key: key);

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text("Ok   Notification"),
            ),
            Text(widget.message!.notification!.title.toString())
          ],
        ),
      ),
    );
  }
}
