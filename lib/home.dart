import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List age = <String>["12", "35", "64", "22"];
  List names = <String>['ali', 'ahmad', 'muaz', 'musa'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: names.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(names[index]),
                subtitle: Text(age[index]),
              );
            }));
  }
}
