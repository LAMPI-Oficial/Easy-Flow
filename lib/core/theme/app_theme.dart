import 'package:flutter/material.dart';

final ThemeData appThemeData = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF0085FF),
    onPrimary: Colors.white,
    secondary: Color(0xFF0085FF),
    onSecondary: Colors.white,
    error: Color(0xFFFF4C4C),
    onError: Colors.white,
    background: Color(0xFFF5F5F5),
    onBackground: Color(0xFF323232),
    surface: Colors.white,
    onSurface: Color(0xFF323232),
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
        fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w500),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16,
      ),
      side: const BorderSide(
          color: Color(0xFF0085FF), width: 1.0, style: BorderStyle.solid),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: const TextStyle(
          fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w400),
    ),
  ),
);
