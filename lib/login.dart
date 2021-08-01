import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController =
        TextEditingController(text: 'ali@gmail.com');
    final TextEditingController passwordController =
        TextEditingController(text: 'ali@gmail');

    void login() async {
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore db = FirebaseFirestore.instance;
      final String email = emailController.text;
      final String password = passwordController.text;

      try {
        final UserCredential user = await auth.signInWithEmailAndPassword(
            email: email, password: password);
        final DocumentSnapshot snapshot =
            await db.collection('users').doc(user.user.uid).get();
        final data = snapshot.data();

        Navigator.of(context).pushNamed('\home');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Enter Email',
                  ),
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Enter Password',
                  ),
                ),
                ElevatedButton(
                  onPressed: login,
                  child: Text('Login'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
