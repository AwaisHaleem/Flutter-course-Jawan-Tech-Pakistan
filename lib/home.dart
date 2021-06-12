import 'package:flutter/material.dart';
import 'package:jawan_tech_flutter_course/login.dart';
import 'package:jawan_tech_flutter_course/register.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var text = '';
  one() {
    setState(() {
      text = '1';
    });
  }

  two() {
    setState(() {
      text = '2';
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Text $text'),
              SizedBox(height: 20),
              ElevatedButton(onPressed: one, child: Text('make 1')),
              SizedBox(height: 20),
              ElevatedButton(onPressed: two, child: Text('make 2')),
            ],
          ),
        ),
      ),
    );
  }
}
