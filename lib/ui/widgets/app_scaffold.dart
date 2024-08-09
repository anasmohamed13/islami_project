import 'package:flutter/material.dart';
import 'package:islamicproject/ui/utils/app_assets.dart';
import 'package:islamicproject/ui/utils/app_colors.dart';
import 'package:islamicproject/ui/utils/app_styles.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold(
      {super.key, this.body, this.bottomNavigationBar, this.appBarTitle});
  final Widget? body;
  final String? appBarTitle;
  final Widget? bottomNavigationBar;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.lightBackGround),
        ),
      ),
      child: Scaffold(
        body: body,
        backgroundColor: AppColor.transparent,
        appBar: AppBar(
          backgroundColor: AppColor.transparent,
          elevation: 0,
          title: Text(
            appBarTitle ?? '',
            style: AppStyle.appBarStyle,
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
