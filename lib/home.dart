import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List cars = <String>[
    'https://image.shutterstock.com/image-illustration/modern-cars-studio-room-3d-260nw-735402217.jpg',
    'https://media.wired.com/photos/5d09594a62bcb0c9752779d9/125:94/w_1994,h_1500,c_limit/Transpo_G70_TA-518126.jpg',
    'https://images.unsplash.com/photo-1525609004556-c46c7d6cf023?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=80',
    'https://i.ytimg.com/vi/dip_8dmrcaU/maxresdefault.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: cars.length,
            itemBuilder: (context, index) {
              return Container(
                height: 200,
                width: 200,
                child: Image.network(cars[index]),
              );
            }));
  }
}
