import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.only(left: 20, top: 20),
          child: Text("Box Decoration"),
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              // color: Colors.red,
              // gradient: LinearGradient(colors: [Colors.red, Colors.yellow]),
              // color: Color(0xff756cc4),
              color: Colors.yellow[400],
              borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
