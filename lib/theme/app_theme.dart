import 'package:flutter/material.dart';
import '../constants/colors.dart';

class AppTheme {
  /// Light Theme Configuration
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: NeubrutalismColor.background,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF6750A4), // Primary color (e.g., purple)
      onPrimary: Colors.white, // Text/icons on primary color
      secondary: Color(0xFF625B71), // Secondary color (e.g., muted purple)
      onSecondary: Colors.white, // Text/icons on secondary color
      background: Color(0xFFF8F8F8), // Background color (light grayish white)
      onBackground: Color(0xFF1E2129), // Text/icons on background
      surface: Colors.white, // Surface color (e.g., cards, dialogs)
      onSurface: Color(0xFF1E2129), // Text/icons on surface
      error: Color(0xFFB00020), // Error color (red)
      onError: Colors.white, // Text/icons on error
    ),
    //const ColorScheme.light(
    //     primary: NeubrutalismColor.primary,
    //     onPrimary: NeubrutalismColor.primaryText,
    //     background: NeubrutalismColor.background,
    //     onBackground: NeubrutalismColor.primaryText,
    //     surface: NeubrutalismColor.background,
    //     onSurface: NeubrutalismColor.primaryText
    //     // secondary: NeubrutalismColor.secondary,
    //     ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: NeubrutalismColor.primaryText),
      bodyMedium: TextStyle(color: NeubrutalismColor.secondaryText),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: NeubrutalismColor.background,
      foregroundColor: NeubrutalismColor.primaryText,
    ),
  );

  /// Dark Theme Configuration
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: NeubrutalismColor.primaryText,
    colorScheme: const ColorScheme.dark(
      primary:
          Color.fromARGB(255, 155, 115, 248), // Primary color (light purple)
      onPrimary: Color(0xFF381E72), // Text/icons on primary color
      secondary: Color(0xFFCCC2DC), // Secondary color (light muted purple)
      onSecondary: Color(0xFF332D41), // Text/icons on secondary color
      background: Color(0xFF1E2129), // Background color (dark navy blue)
      onBackground: Colors.white, // Text/icons on background
      surface: Color(0xFF121212), // Surface color (darker black)
      onSurface: Colors.white, // Text/icons on surface
      error: Color(0xFFCF6679), // Error color (soft red)
      onError: Color(0xFF60141E), // Text/icons on error
    ),
    // const ColorScheme.dark(
    //     primary: NeubrutalismColor.primary,
    //     onPrimary: Colors.white,
    //     background: NeubrutalismColor.background,
    //     onBackground: NeubrutalismColor.primaryText,
    //     surface: NeubrutalismColor.background,
    //     onSurface: NeubrutalismColor.primaryText
    //     // secondary: NeubrutalismColor.secondary,
    //     ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.grey),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: NeubrutalismColor.primaryText,
      foregroundColor: Colors.white,
    ),
  );
}
