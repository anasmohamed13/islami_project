import 'package:flutter/material.dart';
import 'package:islamicproject/ui/utils/app_colors.dart';

abstract class AppStyle {
  static const TextStyle appBarStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColor.accentcolor,
  );
  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w600,
    color: AppColor.accentcolor,
  );
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColor.transparent,
      primaryColor: AppColor.primaryColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.transparent,
        titleTextStyle: appBarStyle,
        elevation: 0,
        centerTitle: true,
      ),
      switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.all(AppColor.primaryColor),
      ));
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.transparent,
  );
}
