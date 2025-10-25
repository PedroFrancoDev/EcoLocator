import 'package:eco_locator/core/enums/theme_status.dart';
import 'package:eco_locator/core/theme/eco_locator_theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeStatus _currentTheme = ThemeStatus.light;

  ThemeStatus get currentThemeStatus => _currentTheme;

  void toggleTheme() {
    _currentTheme = _currentTheme == ThemeStatus.light
        ? ThemeStatus.dark
        : ThemeStatus.light;

    notifyListeners();
  }

  ThemeData get themeData {
    switch (_currentTheme) {
      case ThemeStatus.dark:
        return EcoLocatorTheme.dark;
      case ThemeStatus.light:
        return EcoLocatorTheme.light;
    }
  }
}
