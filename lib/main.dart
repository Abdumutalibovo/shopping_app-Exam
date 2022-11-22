import 'package:flutter/material.dart';
import 'package:shopping_app_exam/presintation/screens/tabs/tab_box/tab_box.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabBox(),
    );
  }
}