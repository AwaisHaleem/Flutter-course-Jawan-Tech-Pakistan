import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Row(
            children: [
              Text('1st element'),
              SizedBox(width: 10,),
              Text('1st element'),
              Text('1st element'),
              Text('1st element'),
              Text('1st element'),
            ],
          )
        ),
      ),
      
    );
  }
}
