import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      backgroundColor: Colors.grey[300],
      scaffoldBackgroundColor: Colors.white,
      cardColor: Colors.grey[300],
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.blue,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Colors.grey[500],
          fontFamily: 'Roboto',
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      indicatorColor: Colors.red,
      useMaterial3: true,
      shadowColor: Colors.grey[300],
      colorScheme: ColorScheme.light(
        brightness: Brightness.light,
        onPrimaryContainer: Colors.green[300],
        onSecondaryContainer: Colors.blue[200],
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      fontFamily: 'Roboto',
    );
  }
}
