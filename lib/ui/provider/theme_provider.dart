import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;

  bool get isDarkTheme => currentTheme == ThemeMode.dark;
  set newTheme(ThemeMode themeMode) {
    currentTheme = themeMode;
    notifyListeners();
  }
}
