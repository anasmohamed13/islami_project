// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:islamicproject/ui/provider/theme_provider.dart';
import 'package:islamicproject/ui/utils/app_assets.dart';
import 'package:islamicproject/ui/utils/app_colors.dart';
import 'package:provider/provider.dart';

class AppScaffold extends StatelessWidget {
  AppScaffold(
      {super.key, this.body, this.bottomNavigationBar, this.appBarTitle});
  final Widget? body;
  final String? appBarTitle;
  final Widget? bottomNavigationBar;
  late ThemeProvider themeProvider;
  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(themeProvider.isDarkTheme
              ? AppAssets.darkBackGround
              : AppAssets.lightBackGround),
        ),
      ),
      child: Scaffold(
        body: body,
        backgroundColor: AppColor.transparent,
        appBar: AppBar(
          title: Text(
            appBarTitle ?? '',
          ),
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
