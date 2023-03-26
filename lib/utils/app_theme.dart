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
      snackBarTheme: SnackBarThemeData(
        backgroundColor: Colors.amber[200]!,
        actionTextColor: Colors.black,
        contentTextStyle: const TextStyle(
          fontSize: 16,
          letterSpacing: 1.2,
          color: Colors.black,
        ),
        elevation: 2,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color(0xFF18171D),
      backgroundColor: const Color(0xFF1C1C24),
      colorScheme: const ColorScheme.dark(
        onPrimaryContainer: Color(0xFF429FE4),
        onSecondaryContainer: Color(0xFF1E1E26),
      ),
      cardColor: const Color(0xFF1C1C24),
      iconTheme: const IconThemeData(
        color: Color(0xFF7C7B7F),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Color(0xFF18171D),
        titleTextStyle: TextStyle(
          fontFamily: 'Roboto',
          color: Color(0xFFB6B5BB),
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: InputBorder.none,
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 12),
        hintStyle: TextStyle(
          color: Color(0xFF7C7B7F),
          fontFamily: 'Roboto',
        ),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontFamily: 'Roboto',
          color: Color(0xFFB6B5BB),
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
