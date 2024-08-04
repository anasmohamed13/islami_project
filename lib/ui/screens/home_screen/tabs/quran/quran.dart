// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:islamicproject/models/sura_details_model.dart';
import 'package:islamicproject/ui/screens/sura_details/sura_details.dart';
import 'package:islamicproject/ui/utils/app_assets.dart';
import 'package:islamicproject/ui/utils/app_colors.dart';
import 'package:islamicproject/ui/utils/app_styles.dart';
import 'package:islamicproject/ui/utils/constans.dart';

class Quran extends StatelessWidget {
  const Quran({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Image.asset(AppAssets.quraTabLogo),
        ),
        const SizedBox(
          height: 5,
        ),
        Expanded(
          flex: 7,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 3,
                    color: AppColor.primaryColor,
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Text(
                          'Name',
                          style: AppStyle.titleTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Verses',
                          style: AppStyle.titleTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  const Divider(
                    height: 3,
                    thickness: 3,
                    color: AppColor.primaryColor,
                  ),
                  Expanded(child: buildSurasList()),
                ],
              ),
              const VerticalDivider(
                thickness: 3,
                color: AppColor.primaryColor,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildSurasList() => ListView.builder(
        itemCount: Constant.suraNames.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.pushNamed(context, SuraDetails.routeName,
                arguments: SuraDetailsArgs(
                    suraNames: Constant.suraNames[index],
                    fileNames: '${index + 1}.txt'));
          },
          child: Row(
            children: [
              Expanded(
                  child: Text(
                Constant.suraNames[index],
                style: AppStyle.titleTextStyle,
                textAlign: TextAlign.center,
              )),
              Expanded(
                  child: Text(
                Constant.versesNumber[index].toString(),
                style: AppStyle.titleTextStyle,
                textAlign: TextAlign.center,
              )),
            ],
          ),
        ),
      );
}
