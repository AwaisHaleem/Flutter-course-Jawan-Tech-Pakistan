import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              color: Colors.amber,
              height: 200,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              color: Colors.amber,
              height: 200,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              color: Colors.amber,
              height: 200,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              color: Colors.amber,
              height: 200,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              color: Colors.amber,
              height: 200,
            ),
          ],
        )
      ]),
    ));
  }
}
