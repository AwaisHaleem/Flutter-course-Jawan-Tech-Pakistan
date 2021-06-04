import 'package:flutter/material.dart';
import 'package:jawan_tech_flutter_course/app.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => App()));
        },
        child: Text('Button'),
      ),
    ));
  }
}
