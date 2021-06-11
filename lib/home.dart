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
      appBar: AppBar(
        title: Text('Drawer Example'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
                color: Colors.yellow, child: DrawerHeader(child: Text('abs'))),
            ListTile(
              title: Text('budjet'),
            ),
            ListTile(
              title: Text('budjet'),
            )
          ],
        ),
      ),
    );
  }
}
