import 'package:flutter/material.dart';
import 'package:my_first_project/views/auth/blink_screen.dart';
// Import the login page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(), // Start with login page
    );
  }
}
