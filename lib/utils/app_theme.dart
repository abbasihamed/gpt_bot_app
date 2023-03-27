import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFF2F2F3),
      primaryColor: const Color(0xFF042FFC),
      backgroundColor: const Color(0xFFF2F2F3),
      cardColor: const Color(0xFFB7BDD7),
      colorScheme: const ColorScheme.light(
        onPrimaryContainer: Color(0xFF2556EB),
        onSecondaryContainer: Color(0xFFB7BDD7),
      ),
      iconTheme: const IconThemeData(
        color: Color(0xFF595556),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Color(0xFF042FFC),
        titleTextStyle: TextStyle(
          fontFamily: 'Roboto',
          color: Color(0xFFF2F2F3),
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: InputBorder.none,
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 12),
        hintStyle: TextStyle(
          color: Color(0xFF595556),
          fontFamily: 'Roboto',
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontFamily: 'Roboto',
          color: Color(0xFF070708),
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        labelSmall: TextStyle(
          fontFamily: 'Roboto',
          color: Color(0xFF070708),
          fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF1C1C24),
      primaryColor: const Color(0xFF18171D),
      backgroundColor: const Color(0xFF1C1C24),
      colorScheme: const ColorScheme.dark(
        onPrimaryContainer: Color(0xFF429FE4),
        onSecondaryContainer: Color(0xFF1E1E26),
      ),
      cardColor: const Color(0xFF18171D),
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
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontFamily: 'Roboto',
          color: Color(0xFFF2F2F3),
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        labelSmall: TextStyle(
          fontFamily: 'Roboto',
          color: Color(0xFFF2F2F3),
          fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
