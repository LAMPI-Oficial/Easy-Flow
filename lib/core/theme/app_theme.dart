import 'package:flutter/material.dart';

final ThemeData appThemeData = ThemeData(
  fontFamily: 'Poppins',
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
  appBarTheme: const AppBarTheme(elevation: 0),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
        fontSize: 16,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: const TextStyle(
        fontSize: 16,
      ),
      side: const BorderSide(
          color: Color(0xFF0085FF), width: 1.0, style: BorderStyle.solid),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  dropdownMenuTheme: DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(0),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Color(0xFFD4D4D4),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      errorStyle: const TextStyle(
        fontFamily: 'Segoe_UI',
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
