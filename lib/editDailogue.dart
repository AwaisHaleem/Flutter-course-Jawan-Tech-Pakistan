import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as path;

class EditDialogue extends StatefulWidget {
  final Map data;
  EditDialogue({this.data});

  @override
  _EditDialogueState createState() => _EditDialogueState();
}


class _EditDialogueState extends State<EditDialogue> {
TextEditingController titleController = TextEditingController();
TextEditingController descriptionController = TextEditingController();
@override
void initState() {
  super.initState();
  titleController.text = widget.data['title'];
  descriptionController.text = widget.data['description'];
}
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

    void done() async {
      try {
        String imageName = path.basename(imagePath);
        firebase_storage.Reference ref =
            firebase_storage.FirebaseStorage.instance.ref('/$imageName');

        File file = File(imagePath);
        await ref.putFile(file);

        String downloadedUrl = await ref.getDownloadURL();

        FirebaseFirestore db = FirebaseFirestore.instance;

        Map<String, dynamic> newPost = {
          'title': titleController.text,
          'description': descriptionController.text,
          'url': downloadedUrl
        };

        await db.collection('Posts').doc(widget.data['id']).set(newPost);
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
            onPressed: done,
            child: Text('Done'),
          ),
        ],
      )),
    );
  }
}
