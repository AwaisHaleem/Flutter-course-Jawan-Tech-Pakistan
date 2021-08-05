import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as path;

class EditPost extends StatefulWidget {
  final Map data;
  EditPost({this.data});

  @override
  _EditPostState createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  String imagePath;
  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();

    final TextEditingController descriptionController = TextEditingController();

    void imagePicker() async {
      final ImagePicker _picker = ImagePicker();
      final image = await _picker.getImage(source: ImageSource.gallery);
      setState(() {
        imagePath = image.path;
      });
    }

    void editDone() async {
      try {
        firebase_storage.FirebaseStorage storage =
            firebase_storage.FirebaseStorage.instance;
        String imageName = path.basename(imagePath);

        firebase_storage.Reference ref = storage.ref('/$imageName');
        File file = File(imagePath);
        await ref.putFile(file);
        String downloadedUrl = await ref.getDownloadURL();

        FirebaseFirestore db = FirebaseFirestore.instance;

        Map<String, dynamic> newPost = {
          'title': titleController.text,
          'description': descriptionController.text,
          'url': downloadedUrl,
        };
        print(newPost);
        // await db.collection('Posts').doc(widget.data['id']).set(newPost);
        Navigator.of(context).pop();
      } catch (e) {
        print(e);
      }
    }

    return AlertDialog(
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
              onPressed: editDone,
              child: Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}
