import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notification_practice/view/splace_screen.dart';
import 'data/noto.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future backgroundmessage(RemoteMessage message) async {
  await Firebase.initializeApp();
  log('backgroundmessaging== ${await message.notification}');
  log('backgroundmessaging== ${message}');
  // Notificationss().showTimerNotification(message);
}

String? tokens;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // var a = await FirebaseMessaging.instance.getNotificationSettings();

  FirebaseMessaging.onBackgroundMessage(backgroundmessage);

  // NotificationService().requstnotification();
  // token = await NotificationService().gettoken();

  Notificationss().requstnotification();
  token = await Notificationss().gettoken();
  tokens = token;
  print("token=>>>>>>> $token");
  //
  FlutterLocalNotificationsPlugin()
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()!
      .requestPermission();

  runApp(MyApp());
}

String? token = "";

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplaceScreen(),
    );
  }
}
