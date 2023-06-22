import 'package:flutter/material.dart';

class HomeScrreen extends StatefulWidget {
  const HomeScrreen({Key? key}) : super(key: key);

  @override
  State<HomeScrreen> createState() => _HomeScrreenState();
}

class _HomeScrreenState extends State<HomeScrreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (p0, p1) {
          if (p1.maxWidth > 900) {
            return DestopScreen();
          } else {
            return MobileScreen();
          }
        },
      ),
    );
  }
}

class DestopScreen extends StatefulWidget {
  const DestopScreen({Key? key}) : super(key: key);

  @override
  State<DestopScreen> createState() => _DestopScreenState();
}

class _DestopScreenState extends State<DestopScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Image.asset("images/usgs-hoS3dzgpHzw-unsplash.jpg"),
                ListView.separated(
                    itemBuilder: (context, index) {
                      return Icon(
                        Icons.home,
                        size: 35,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: 5)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MobileScreen extends StatefulWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.mheight * .3,
      color: Colors.orange,
    );
  }
}

extension MeadiQuaries on BuildContext {
  double mwidth() => MediaQuery.of(this).size.width;
  double get mheight => MediaQuery.of(this).size.height;
}
