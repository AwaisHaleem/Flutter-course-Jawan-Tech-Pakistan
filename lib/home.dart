import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List names = <String>['Ali', 'Ahmad', 'Ghazali', 'mosa'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: List.generate(names.length, (index) {
              return Container(
                  height: 100,
                  width: 100,
                  color: Colors.pink,
                  child: Text(names[index]));
            })));
  }
}
