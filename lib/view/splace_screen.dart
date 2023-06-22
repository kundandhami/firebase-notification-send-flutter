import 'package:flutter/material.dart';
import 'package:notification_practice/view/responsive_ui/home.dart';
import 'package:notification_practice/view/social_app/SocialScreen.dart';
import '../practice.dart';
import 'bottomsheet_screen.dart';
import 'homepage.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({Key? key}) : super(key: key);

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2))
        .whenComplete(() => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
            (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orange,
      ),
    );
  }
}
