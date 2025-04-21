import 'package:flutter/material.dart';
import 'package:my_first_project/views/auth/blink-screen-screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: SplashScreen(),
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 36, 35, 35),
        buttonTheme: ButtonThemeData(buttonColor: Color(0xFF800000)),
        fontFamily: 'raleway',
      ),
    ),
  );
}
