import 'package:flutter/material.dart';
import 'package:islamicproject/ui/utils/app_colors.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;

  bool get isDarkTheme => currentTheme == ThemeMode.dark;
  set newTheme(ThemeMode themeMode) {
    currentTheme = themeMode;
    notifyListeners();
  }

  Color get primary => isDarkTheme ? AppColor.primaryDark : AppColor.primary;
}
