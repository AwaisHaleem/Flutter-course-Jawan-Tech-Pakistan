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
            appBar: AppBar(
              title: Center(child: Text('Login')),
            ),
            body: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Center(
                    child: Container(
                      height: 40,
                      child: TextField(),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Container(
                      height: 30,
                      child: TextField(),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(onPressed: () {}, child: Text('Login'))
                ],
              ),
            )));
  }
}
