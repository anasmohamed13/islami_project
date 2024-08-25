// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:islamicproject/ui/utils/app_colors.dart';

abstract class AppStyle {
  static const TextStyle appBarTextStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColor.accent,
  );
  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w600,
    color: AppColor.accent,
  );
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.transparent,
    primaryColor: AppColor.primary,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.transparent,
      titleTextStyle: appBarTextStyle,
      elevation: 0,
      centerTitle: true,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(AppColor.primary),
    ),
    textTheme: TextTheme(
      displayLarge: titleTextStyle,
    ),
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(selectedItemColor: AppColor.accent),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.transparent,
    primaryColor: AppColor.primaryDark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.transparent,
      titleTextStyle: appBarTextStyle.copyWith(color: AppColor.white),
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      displayLarge: titleTextStyle.copyWith(color: AppColor.white),
    ),
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(selectedItemColor: AppColor.accentDark),
  );
}
