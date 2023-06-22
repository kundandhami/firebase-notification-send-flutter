import 'package:flutter/material.dart';

class Practice1 extends StatefulWidget {
  const Practice1({Key? key}) : super(key: key);

  @override
  State<Practice1> createState() => _Practice1State();
}

class _Practice1State extends State<Practice1>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    animation = Tween<double>(begin: 150, end: 500).animate(controller);
    animation.addListener(() {
      setState(() {});
    });
    controller.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Positioned(
              left: 50,
              top: animation.value,
              child: ScaleTransition(
                scale: controller,
                child: Icon(
                  Icons.camera,
                  size: 40,
                  color: Colors.yellow,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
