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
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Colors.grey[500],
          fontFamily: 'Roboto',
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
        size: 24,
      ),
      indicatorColor: Colors.red,
      shadowColor: Colors.grey[300],
      colorScheme: ColorScheme.light(
        brightness: Brightness.light,
        onPrimaryContainer: Colors.green[300],
        onSecondaryContainer: Colors.blue[200],
        onSecondary: Colors.amber[200]!,
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

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      backgroundColor: Colors.grey[300],
      scaffoldBackgroundColor: Colors.white10,
      cardColor: Colors.grey[800],
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.blue,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Colors.grey[500],
          fontFamily: 'Roboto',
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
        size: 24,
      ),
      indicatorColor: Colors.red,
      shadowColor: Colors.grey[300],
      colorScheme: ColorScheme.dark(
        brightness: Brightness.dark,
        onPrimaryContainer: Colors.green[300],
        onSecondaryContainer: Colors.blue[200],
        onSecondary: Colors.amber[900]!,
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
