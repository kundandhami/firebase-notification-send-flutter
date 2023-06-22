import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../data/noto.dart';
import 'package:http/http.dart' as http;
import 'package:notification_practice/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    // NotificationService().firebaseInt(context);
    // NotificationService().setupInteractMessage(context);

    Notificationss().firebasemessaging(context);
    Notificationss().firebasemessagebackground(context);
  }

  TextEditingController controller = TextEditingController(text: tokens);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Homepage"),
        ),
        body: Column(
          children: [
            Container(
              child: TextButton(
                onPressed: () async {
                  Map data = {
                    "to":
                        "fnV6dnhUR7Wusc2eeV0DWh:APA91bHUEdl3uiU83aHw58sQT7_Ok--X7W-ADAOXjDKad2M76YWHQa4XB-GRkrY5XaOr7RmLkfBClCESTJYdsAwLrrKtoPwDtuENmu20Fk9h7ySQQze7hA6_nOT0ikCp5zOE_BFes8zl",
                    "priority": 'high',
                    'notification': {
                      "title": "tap notification",
                      "body": "device notification"
                    },
                    'data': {"type": "msj", "id": "1"}
                  };
                  var res = await http.post(
                    Uri.parse("https://fcm.googleapis.com/fcm/send"),
                    body: jsonEncode(data),
                    headers: {
                      "Content-Type": 'application/json; charset=UTF-8',
                      "Authorization":
                          "key=AAAAY-AGWW8:APA91bGXQ63mkphzTOfxKSlkWXigDddv7wxmWK4tsAqopsgQkE2JlXPRJSfRVttQw1S3Q0Uz2qVd3MaQVGFoqCMwI_yqJ06UKomZNdKq766Y4fQBY0EqcvM2Jfms_YM8lq9Sd5QWtA5_" //serverkey
                    },
                  );
                  print("==============$res");
                  await Clipboard.setData(
                    ClipboardData(
                      text: "successfully copy clipboard",
                    ),
                  );
                  // copied successfully snackbar ma message devay
                },
                child: Text("Send notification"),
              ),
            ),
            TextField(controller: controller, maxLines: 5)
          ],
        ));
  }
}
