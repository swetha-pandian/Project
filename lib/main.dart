import 'package:flutter/material.dart';
import 'package:my_first_project/utility/extension.dart';
import 'package:my_first_project/utility/utilities.dart';
import 'package:my_first_project/views/auth/blink-screen-screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      theme: ThemeData(
        primaryColor: getColorFromHex("BC2954"),
        scaffoldBackgroundColor: getColorFromHex("F3F3F3"),
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          shadowColor: Colors.transparent,
          iconTheme: IconThemeData(color: getColorFromHex("454F63")),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            color: "90959DAD".getColor(),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.apply(
            bodyColor: "454F63".getColor(),
            displayColor: "454F63".getColor(),
          ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: getColorFromHex("BC2954"),
        ),
      ),
    );
  }
}
