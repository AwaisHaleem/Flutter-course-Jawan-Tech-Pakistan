import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Post extends StatelessWidget {
  final Map data;
  Post({this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Image.network(
            data['url'],
            width: 100,
            height: 100,
          ),
          Text(data['title']),
          Text(data['description'])
        ],
      ),
    );
  }
}
