import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceEvenly, // try all methods of MainAxisAlignment class
          children: [
            Text('1st element'),
            SizedBox(
              width: 10,
            ),
            Text('2nd element'),
            Text('3rd element'),
          ],
        )),
      ),
    );
  }
}
