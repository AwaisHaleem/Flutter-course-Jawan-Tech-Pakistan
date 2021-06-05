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
        body: Column(
      children: [abc(), abc(), abc(), abc()],
    ));
  }
}

Widget abc() {
  return ListTile(
    leading: CircleAvatar(
      backgroundColor: Colors.green,
      radius: 20,
    ),
    title: Text('Bilal'),
    subtitle: Text('Hey!.....'),
    trailing: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('04:09 pm'),
        CircleAvatar(
          backgroundColor: Colors.green[200],
          radius: 10,
        )
      ],
    ),
  );
}
