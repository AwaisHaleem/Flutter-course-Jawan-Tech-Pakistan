import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jawan_tech_flutter_course/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as path;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Stream postStream =
      FirebaseFirestore.instance.collection('Posts').snapshots();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String imagePath;

  @override
  Widget build(BuildContext context) {
    void imagePicker() async {
      final ImagePicker _picker = ImagePicker();
      final image = await _picker.getImage(source: ImageSource.gallery);
      setState(() {
        imagePath = image.path;
      });
    }

    void submitPost() async {
      try {
        final title = titleController.text;
        final description = descriptionController.text;

        firebase_storage.FirebaseStorage storage =
            firebase_storage.FirebaseStorage.instance;
        String imageName = path.basename(imagePath);

        firebase_storage.Reference ref = storage.ref('/$imageName');
        File file = File(imagePath);
        await ref.putFile(file);

        String downloadedUrl = await ref.getDownloadURL();
        FirebaseFirestore db = FirebaseFirestore.instance;
        print('This is imagae path ' + imagePath);
        print('This is download url path ' + downloadedUrl);

        await db.collection('Posts').add(
          {'title': title, 'description': description, 'url': downloadedUrl},
        );
        print('File uploaded successfully');
      } catch (e) {
        print(e.message);
      }
    }

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Enter Title',
                ),
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Enter Description',
                ),
              ),
              ElevatedButton(
                onPressed: imagePicker,
                child: Text('Pick Image'),
              ),
              ElevatedButton(
                onPressed: submitPost,
                child: Text('Submit Post'),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: postStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("Loading");
                      }

                      return new ListView(
                        children:
                            snapshot.data.docs.map((DocumentSnapshot document) {
                          Map data = document.data();

                          return Post(
                            data: data,
                          );
                        }).toList(),
                      );
                    },
                  ),

                  // // new ListView(
                  // //   children:
                  // //       snapshot.data.docs.map((DocumentSnapshot document) {
                  // //     Map data = document.data();
                  // //     return Post(
                  // //       data: data,
                  // //     );
                  //   }).toList(),
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
