import 'package:flutter/material.dart';
import 'package:messaging_app/Screens/MainScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MainScreen(title: "Messaging"),
    );
  }
}

