import 'package:flutter/material.dart';
import 'package:jawan_tech_flutter_course/login.dart';
import 'package:jawan_tech_flutter_course/register.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text('Hello'),
            bottom: TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: Colors.white,
              indicatorColor: Colors.red,
              tabs: [Text('Login'), Text('Register')],
            )),
        body: TabBarView(
          children: [Login(), Register()],
        ),
      ),
    );
  }
}
