import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    // scaffoldBackgroundColor: const Color(0xFF1A1A1A),
    scaffoldBackgroundColor: NeubrutalismColor.primaryText,
    colorScheme: const ColorScheme.dark(primary: Colors.white),
  );
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    // scaffoldBackgroundColor: const Color(0xFF1A1A1A),
    scaffoldBackgroundColor: NeubrutalismColor.background,
    colorScheme: const ColorScheme.dark(primary: Colors.white),
  );
}
