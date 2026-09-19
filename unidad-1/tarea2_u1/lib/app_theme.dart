import 'package:flutter/material.dart';

class AppTheme {
  static const colorPrimary = Colors.green;
  static const fondo = Color(0xFFF5F9F5);
  static const double pagePadding = 16.0;
  static const double controlSpacing = 16.0;

  static ThemeData get themeData => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: colorPrimary,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: fondo,
    appBarTheme: const AppBarTheme(
      backgroundColor: colorPrimary,
      foregroundColor: Colors.white,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(0, 48.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 14.0,
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: colorPrimary, width: 2.0),
      ),
      labelStyle: const TextStyle(fontSize: 16.0),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 18.0),
      bodyMedium: TextStyle(fontSize: 16.0),
      labelLarge: TextStyle(fontSize: 16.0),
    ),
  );
}
