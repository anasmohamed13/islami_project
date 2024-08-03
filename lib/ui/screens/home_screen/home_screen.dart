// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:islamicproject/ui/utils/app_assets.dart';
import 'package:islamicproject/ui/utils/app_colors.dart';
import 'package:islamicproject/ui/utils/app_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String RouteName = 'home';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.lightBackGround),
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColor.transparent,
        appBar: AppBar(
          backgroundColor: AppColor.transparent,
          elevation: 0,
          title: const Text(
            'islami',
            style: AppStyle.appBarStyle,
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(canvasColor: AppColor.primaryColor),
          child: BottomNavigationBar(
              selectedItemColor: AppColor.accentcolor,
              selectedIconTheme: const IconThemeData(size: 38),
              items: const [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage((AppAssets.icQuran))),
                    label: 'Quran'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage((AppAssets.icHadeth))),
                    label: 'Ahadeth'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage((AppAssets.icSebha))),
                    label: 'Sebha'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage((AppAssets.icRadio))),
                    label: 'Radio')
              ]),
        ),
      ),
    );
  }
}
