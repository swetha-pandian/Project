import 'package:flutter/material.dart';
import 'package:my_first_project/views/auth/blink_screen.dart';
// Import the login page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(backgroundColor: Colors.black45), // Start with login page
    );
  }
}
