import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'models/dbhelper.dart';

void main() {
  runApp(MyApp());
  new DBhelper().start();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Story Garden',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MainScreen(),
    );
  }
}