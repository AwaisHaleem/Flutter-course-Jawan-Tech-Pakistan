import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Container(
            height: 100,
            width: 100,
            color: Colors.red,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            height: 100,
            width: 100,
            color: Colors.yellow,
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            height: 100,
            width: 100,
            color: Colors.purple,
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            height: 100,
            width: 100,
            color: Colors.green,
          ),
        ),
        Positioned(
          left: 20,
          top: 20,
          child: Container(
            height: 100,
            width: 100,
            color: Colors.black,
          ),
        ),
      ],
    ));
  }
}
