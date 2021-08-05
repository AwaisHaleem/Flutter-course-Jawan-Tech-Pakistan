import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jawan_tech_flutter_course/editDailogue.dart';

class Post extends StatelessWidget {
  final Map data;
  Post({this.data});

  @override
  Widget build(BuildContext context) {
    void deletePost() async {
      FirebaseFirestore db = FirebaseFirestore.instance;
      try {
        db.collection('Posts').doc(data['id']).delete();
      } catch (e) {
        print(e.message);
      }
    }

    void editDialogue() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return EditDialogue(data: data);
          });
    }

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Column(
        children: [
          Image.network(
            data['url'],
            height: 100,
            width: 100,
          ),
          Text(data['title']),
          Text(data['description']),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: deletePost,
                child: Icon(Icons.delete),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: editDialogue,
                child: Icon(Icons.edit),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
