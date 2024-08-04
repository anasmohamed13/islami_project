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
}
