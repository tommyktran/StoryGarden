import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'models/dbhelper.dart';
import 'models/stories.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<Stories>(create: (context) => Stories(), child: MyApp()));
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