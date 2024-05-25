import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProfilePage(),
    );
  }
}

void main() => runApp(const MyApp());

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color(0xFFE5A411), Color(0xFFFFD79F)],
          ),
        ),
        child: const Center(
          child: CircleAvatar(
            radius: 50, // Adjust the size as needed
            backgroundImage: NetworkImage('URL_of_the_dp'), // Replace with actual image URL
          ),
        ),
      ),
    );
  }
}
