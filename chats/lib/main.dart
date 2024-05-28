import 'package:flutter/material.dart';
//import 'package:chats/screens/profilepage.dart';
import 'package:chats/chats/dmpage.dart';
import 'package:chats/chats/dm.dart';

void main() {
  runApp(MyApp());
}
  class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue, // Changed from Colors.white to a valid MaterialColor
      ),
      home: ChatPage(), // Set ChatPage as the home widget
    );
  }
}
