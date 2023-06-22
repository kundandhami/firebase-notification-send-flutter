import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'package:app_settings/app_settings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../view/navigatorscreen.dart';

// class NotificationService {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   Future<void> requstnotification() async {
//     NotificationSettings settings = await messaging.requestPermission(
//         alert: true,
//
//         ///device per show karva
//         announcement: true,
//
//         ///airpod hoy to siri read no kari sake
//         badge: true,
//
//         ///
//         carPlay: true,
//         criticalAlert: true,
//         sound: true,
//         provisional: true);
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       print("user give permission");
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//       print("user give provisional");
//     } else {
//       print("user give denied");
//       // AppSettings.openNotificationSettings();
//     }
//   }
//
//   Future<String?> gettoken() async {
//     String? tokan = await messaging.getToken();
//     print("Token=======$tokan");
//     return tokan;
//   }
//
//   Future<void> firebaseInt(BuildContext context) async {
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//             badge: true, sound: true, alert: true);
//     FirebaseMessaging.onMessage.listen((message) {
//       print(message.notification?.title.toString());
//       /*   if(Platform.isAndroid){
//         localnotificationInit(context, message);
//         shownotification(message);
//       }else{
//         shownotification(message);  ///ios ma local notification initalise no hoy to chale
//       }*/
//       print("onmessage===================${message.data}");
//       print("onmessage===================${message.notification}");
//       localnotificationInit(context, message);
//       shownotification(message);
//     });
//   }
//
//   Future<void> setupInteractMessage(BuildContext context) async {
//     RemoteMessage? initalmessage =
//         await FirebaseMessaging.instance.getInitialMessage();
//
//     /// when  app is terminated
//     if (initalmessage != null) {
//       handlemessage(context, initalmessage);
//     }
//
//     /// when background
//     FirebaseMessaging.onMessageOpenedApp.listen((event) {
//       handlemessage(context, event);
//     });
//   }
//
//   void localnotificationInit(BuildContext context, RemoteMessage message) {
//     AndroidInitializationSettings androidInitializationSettings =
//         AndroidInitializationSettings("@mipmap/ic_launcher");
//     DarwinInitializationSettings ios = DarwinInitializationSettings();
//     InitializationSettings initializationSettings = InitializationSettings(
//         android: androidInitializationSettings, iOS: ios);
//     flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse: (payload) {
//       print("payload========${payload.payload}");
//       handlemessage(context, message);
//     });
//   }
//
//   void shownotification(RemoteMessage message) {
//     AndroidNotificationChannel channel = AndroidNotificationChannel(
//       Random.secure().nextInt(1000).toString(),
//       "High Importance Notification",
//       importance: Importance.max,
//     );
//     AndroidNotificationDetails details = AndroidNotificationDetails(
//         channel.id, channel.name,
//         channelDescription: "your channel Description",
//         importance: Importance.max,
//         priority: Priority.high,
//         ticker: "ticker");
//     DarwinNotificationDetails ios = DarwinNotificationDetails(
//         presentAlert: true, presentBadge: true, presentSound: true);
//     NotificationDetails notificationDetails =
//         NotificationDetails(iOS: ios, android: details);
//
//     Future.delayed(
//       Duration.zero,
//       () {
//         flutterLocalNotificationsPlugin.show(
//             Random.secure().nextInt(1000),
//             message.notification?.title.toString(),
//             message.notification?.body.toString(),
//             notificationDetails);
//       },
//     );
//   }
//
//   void handlemessage(BuildContext context, RemoteMessage message) {
//     print("handlemessage=messageId============${message.messageId}");
//     print("handlemessage==ttl===========${message.ttl}");
//     print(
//         "handlemessage==notification===========${message.notification?.android}");
//     print(
//         "handlemessage==notification===========${message.notification?.titleLocArgs}");
//     print(
//         "handlemessage==notification===========${message.notification?.bodyLocArgs}");
//     print("handlemessage=data============${message.data}");
//     print("handlemessage==category===========${message.category}");
//     print("handlemessage==collapseKey===========${message.collapseKey}");
//     print(
//         "handlemessage=contentAvailable============${message.contentAvailable}");
//     print("handlemessage==from===========${message.from}");
//     print("handlemessage=messageType============${message.messageType}");
//     print("handlemessage==mutableContent===========${message.mutableContent}");
//     print("handlemessage==senderId===========${message.senderId}");
//     print("handlemessage=sentTime============${message.sentTime}");
//     print("handlemessage threadId=============${message.threadId}");
//     // if (message.data['type'] == "msj") {
//     //   // Navigator.push(context, route);
//     // }
//     Navigator.push(context, MaterialPageRoute(
//       builder: (contexts) {
//         return NavigatorPage(
//           message: message,
//         );
//       },
//     ));
//     print(r"complert $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
//   }
// }
//
/// main  ni uppdar
// Future backgroundmessage(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print('backgroundmessaging== ${await message.notification}');
//   print('backgroundmessaging== ${message}');
// }
///void main ma
// FirebaseMessaging.onBackgroundMessage(backgroundmessage);

///void main ma
// FlutterLocalNotificationsPlugin()
//     .resolvePlatformSpecificImplementation<
//     AndroidFlutterLocalNotificationsPlugin>()!
// .requestPermission();

///import in metadata manifest under appilcattion tag
// <meta-data
// android:name="com.google.firebase.messaging.default_notification_channel_id"
// android:value="high_importance_channel" />

class Notificationss {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> requstnotification() async {
    ///ios
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            badge: true, sound: true, alert: true);

    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        sound: true,
        provisional: true);
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("user give permission");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print("user give provisional");
    } else {
      print("user give denied");
      AppSettings.openNotificationSettings(callback: () {});
    }
  }

  void localnotificationinintal(RemoteMessage message, BuildContext context) {
    print("111localnotification initalise");
    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    DarwinInitializationSettings ios = DarwinInitializationSettings();
    InitializationSettings initializationSettings = InitializationSettings(
        android: androidInitializationSettings, iOS: ios);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (plyload) {
      print("-------playload==>${plyload.payload}");
      print("-------playload==>${message.notification?.title}");
      handlemessage(message, context);
    });
  }

  Future<void> notificationshow(RemoteMessage message) async {
    print("111notification show");
    AndroidNotificationDetails android = AndroidNotificationDetails(
      // Random.secure().nextInt(10000).toString(),
      "123",
      "channelName",
      channelDescription: "High importance",
      priority: Priority.high,
      importance: Importance.max,
    );
    DarwinNotificationDetails ios = DarwinNotificationDetails(
        presentAlert: true, presentBadge: true, presentSound: true);
    NotificationDetails notificationDetails =
        NotificationDetails(android: android, iOS: ios);

    final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    await flutterLocalNotificationsPlugin.show(
        id,
        // Random.secure().nextInt(1000),
        message.notification?.title,
        message.notification?.body,
        notificationDetails);
  }

  void handlemessage(RemoteMessage message, BuildContext context) {
    print("111===here message handle===>${message.notification?.title}");

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NavigatorPage(message: message),
        ));
  }

  void firebasemessaging(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      print("111onMessage+++++++++");
      localnotificationinintal(message, context);
      notificationshow(message);
      // showTimerNotification(message);
    });
  }

  Future<void> firebasemessagebackground(BuildContext context) async {
    RemoteMessage? message = await messaging.getInitialMessage();

    if (message != null) {
      print("111bg======");
      handlemessage(message, context);
    }

    FirebaseMessaging.onMessageOpenedApp.listen((messages) {
      print("111onMessageOpenedApp+++++++++");

      // localnotificationinintal(messages, context);
      handlemessage(messages, context);
    });
  }

  Future<String?> gettoken() async {
    return await messaging.getToken();
  }

  Future<void> showTimerNotification(RemoteMessage message) async {
    // Calculate the end time for the timer
    final endTime = DateTime.now().add(Duration(seconds: 15));

    // Initialize the timer
    Timer? timer;

    // Define the timer callback function
    Future<void> updateNotification(Timer t) async {
      final remainingTime = endTime.difference(DateTime.now()).inSeconds;

      // Update the notification content with the remaining time
      final androidPlatformChannelSpecifics = AndroidNotificationDetails(
          '123', 'your_channel_name',
          channelDescription: "sdsdfa",
          importance: Importance.max,
          priority: Priority.high,
          showWhen: true,
          ongoing: true, // Keeps the notification persistent
          // styleInformation: BigTextStyleInformation('Remaining Time: $remainingTime seconds'),
          autoCancel: false,
          timeoutAfter: 10000,
          vibrationPattern: Int64List(0));
      final iOSPlatformChannelSpecifics = DarwinNotificationDetails();
      final platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics,
      );
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      await flutterLocalNotificationsPlugin.show(
        id,
        message.notification?.title,
        message.notification?.body,
        platformChannelSpecifics,
        payload: 'your_notification_payload',
      );

      // If the timer has expired, cancel it
      if (remainingTime <= 0) {
        timer?.cancel();
      }
    }

    // Update the notification every second
    timer = Timer.periodic(Duration(seconds: 1), updateNotification);
  }
}
