// ignore_for_file: avoid_unnecessary_containers, must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:islamicproject/ui/provider/language_provider.dart';
import 'package:islamicproject/ui/provider/theme_provider.dart';
import 'package:islamicproject/ui/utils/app_assets.dart';
import 'package:islamicproject/ui/utils/app_colors.dart';
import 'package:islamicproject/ui/utils/sebha_name.dart';
import 'package:provider/provider.dart';

class Sebha extends StatefulWidget {
  const Sebha({super.key});

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  late ThemeProvider themeProvider;
  late LanguageProvider languageProvider;

  int counter = 0;

  int index = 0;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    languageProvider = Provider.of(context);
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Container(
          height: 400,
          child: Stack(
            children: [
              Center(
                  child: Transform.rotate(
                angle: counter.toDouble() * 0.2,
                child: Image.asset(themeProvider.isDarkTheme
                    ? AppAssets.bodySebhaDark
                    : AppAssets.bodySebhaLogo),
              )),
              Positioned(
                  bottom: 290,
                  right: 148,
                  child: Image.asset(themeProvider.isDarkTheme
                      ? AppAssets.headSebhaDark
                      : AppAssets.headSebhaLogo)),
            ],
          ),
        ),
        Text(
          'عدد التسبيحات ',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Container(
          height: 60,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
                themeProvider.isDarkTheme ? AppColor.accent : AppColor.primary,
          ),
          child: Center(
              child: Text(
            counter.toString(),
            style: themeProvider.isDarkTheme
                ? const TextStyle(color: AppColor.white, fontSize: 20)
                : const TextStyle(color: AppColor.accent, fontSize: 20),
          )),
        ),
        const SizedBox(
          height: 40,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            backgroundColor: themeProvider.isDarkTheme
                ? AppColor.accentDark
                : AppColor.primary,
          ),
          onPressed: () {
            if (counter >= 32 && index < 2) {
              setState(() {
                counter = 0;
                index++;
              });
            } else if (counter >= 32 && index >= 2) {
              setState(() {
                counter = 0;
                index = 0;
              });
            } else {
              setState(() {
                counter++;
              });
            }
          },
          child: Builder(
            builder: (context) {
              if (languageProvider.local == 'en') {
                return Text(
                  SebhaName.sebhaNameEn[index],
                  style: Theme.of(context).textTheme.bodyLarge,
                );
              } else {
                return Text(
                  SebhaName.sebhaNameAr[index],
                  style: Theme.of(context).textTheme.bodyLarge,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
