import 'package:flutter/material.dart';

import 'package:chatapplication/screens/dmpage.dart';// Corrected path assuming the folder is named 'screens'

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatPage(), // Set ChatPage as the home widget
    );
  }
}

