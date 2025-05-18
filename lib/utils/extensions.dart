import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  /// Returns true if the screen width is less than 600 pixels.
  bool get isMobile {
    return MediaQuery.of(this).size.width < 600;
  }

  /// Returns true if the screen width is greater than or equal to 600 pixels
  /// and less than 900 pixels.
  bool get isTablet {
    final width = MediaQuery.of(this).size.width;
    return width >= 600 && width < 900;
  }

  /// Returns true if the screen width is greater than or equal to 900 pixels.
  bool get isDesktop {
    return MediaQuery.of(this).size.width >= 900;
  }

  /// Returns the screen width.
  double get screenWidth {
    return MediaQuery.of(this).size.width;
  }

  /// Returns the screen height.
  double get screenHeight {
    return MediaQuery.of(this).size.height;
  }

  // Calculate padding based on screen size
  double get horizontalPadding => isMobile
      ? 16.0
      : isTablet
          ? 50.0
          : 120.0;
  double get verticalPadding => screenHeight * 0.1; // Adjust as needed
}

extension ThemeExtensions on BuildContext {
  ColorScheme get color => Theme.of(this).colorScheme;
  TextTheme get text => Theme.of(this).textTheme;
}
