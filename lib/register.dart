import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void register() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;

    final String username = usernameController.text;
    final String email = emailController.text;
    final String password = passwordController.text;

    try {
      final UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await db
          .collection('users')
          .doc(user.user.uid)
          .set({'email': email, 'username': username});
      print('User Registerd');
    } catch (e) {
      print('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SafeArea(
          child: Column(
            children: [
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Enter your username'),
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Enter your email'),
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Enter your password'),
              ),
              ElevatedButton(
                onPressed: register,
                child: Text('Register'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
