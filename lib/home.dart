import 'package:flutter/material.dart';
import 'package:jawan_tech_flutter_course/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  final Stream postStream =
      FirebaseFirestore.instance.collection('posts').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
            child: StreamBuilder<QuerySnapshot>(
          stream: postStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return new ListView(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
                Map data = document.data();
                return Post(
                  data: data,
                );
                //     new ListTile(
                //       title: new Image.network(data['url']),
                //       subtitle: new Text(data['title']),
                //       trailing: Text('description'),
                //     );
              }).toList(),
            );
          },
        )),
      ),
    );
  }
}
