import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class BottomSheeets extends StatefulWidget {
  const BottomSheeets({Key? key}) : super(key: key);

  @override
  State<BottomSheeets> createState() => _BottomSheeetsState();
}

class _BottomSheeetsState extends State<BottomSheeets> {
  GlobalKey<ScaffoldState> globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            child: RawMaterialButton(
              onPressed: () {
                bottomssheets();
              },
              child: Text("Bottom Sheet"),
            ),
          ),
        ],
      ),
    );
  }

  void bottomssheets() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          height: 300,
          child: Column(
            children: [
              FlutterLogo(),
              FlutterLogo(),
              FlutterLogo(),
              FlutterLogo(),
            ],
          ),
        );
      },
    );
  }
}
