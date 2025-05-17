import 'package:flutter/material.dart';

class ScrollState with ChangeNotifier {
  bool _isAtTop = true; // Tracks whether the user is at the top of the page

  bool get isAtTop => _isAtTop;

  void setAtTop(bool value) {
    if (_isAtTop != value) {
      _isAtTop = value;
      notifyListeners(); // Notify listeners when the state changes
    }
  }
}
