import 'package:flutter/material.dart';

/// Provider for managing the app's theme state
class ThemeState with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners(); // Notify listeners to rebuild widgets
  }
}
