import 'package:flutter/material.dart';

class Practise2 extends StatefulWidget {
  const Practise2({Key? key}) : super(key: key);

  @override
  State<Practise2> createState() => _Practise2State();
}

class _Practise2State extends State<Practise2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inherited Widget"),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.amber,
          )
        ],
      ),
    );
  }
}
