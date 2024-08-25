// ignore_for_file: constant_identifier_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:islamicproject/ui/provider/theme_provider.dart';
import 'package:islamicproject/ui/screens/home_screen/tabs/hadeth/hadeth.dart';
import 'package:islamicproject/ui/screens/home_screen/tabs/quran/quran.dart';
import 'package:islamicproject/ui/screens/home_screen/tabs/radio/radio_islami.dart';
import 'package:islamicproject/ui/screens/home_screen/tabs/sebha/sebha.dart';
import 'package:islamicproject/ui/screens/home_screen/tabs/settings/settings.dart';
import 'package:islamicproject/ui/utils/app_assets.dart';
import 'package:islamicproject/ui/widgets/app_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ThemeProvider themeProvider;

  int selectedTabIndex = 0;
  List<Widget> tabs = const [
    Quran(),
    Ahadeth(),
    Sebha(),
    RadioIslami(),
    Settings()
  ];
  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return AppScaffold(
      appBarTitle: AppLocalizations.of(context)!.islami,
      body: tabs[selectedTabIndex],
      bottomNavigationBar: buildbottomNavigationBar(),
    );
  }

  Theme buildbottomNavigationBar() {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: themeProvider.primary),
      child: BottomNavigationBar(
          onTap: (index) {
            selectedTabIndex = index;
            setState(() {});
          },
          currentIndex: selectedTabIndex,
          selectedIconTheme: const IconThemeData(size: 38),
          unselectedIconTheme: const IconThemeData(size: 34),
          items: [
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage((AppAssets.icQuran))),
                label: AppLocalizations.of(context)!.quran),
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage((AppAssets.icHadeth))),
                label: AppLocalizations.of(context)!.ahadeth),
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage((AppAssets.icSebha))),
                label: AppLocalizations.of(context)!.sebha),
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage((AppAssets.icRadio))),
                label: AppLocalizations.of(context)!.radio),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: AppLocalizations.of(context)!.settings),
          ]),
    );
  }
}
