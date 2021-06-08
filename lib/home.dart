import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            color: Colors.red,
            height: 100,
            child: Row(
              children: [
                Container(
                  color: Colors.yellow,
                  height: 100,
                  width: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('abs'),
                      Row(
                        children: [
                          Text('abs'),
                          Text('abs'),
                        ],
                      ),
                      Text('abs'),
                      Text('abs'),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
