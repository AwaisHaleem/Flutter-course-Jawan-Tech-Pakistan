import 'package:flutter/material.dart';
import 'package:jawan_tech_flutter_course/home.dart';
import 'package:jawan_tech_flutter_course/login.dart';
import 'package:jawan_tech_flutter_course/register.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'User Authentication',
            home: Login(),
            routes: {
              '/login': (context) => Login(),
              '/Register': (context) => Register(),
              '/home': (context) => Home(),
            },
          );
        }

        return Container();
      },
    );
  }
}
