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
          child: Column(
            children: [
              Text('1st line'),
              SizedBox(height: 10,),
              Text('2nd line'),
              Text('3rd line'),
              SizedBox(height: 10,),
              Text('4th line'),
              Text('5th line'),
              Text('6th line'),
            ],
          ),
        ),
      ),
      
    );
  }
}
