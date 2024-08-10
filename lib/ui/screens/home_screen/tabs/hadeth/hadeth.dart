// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamicproject/ui/screens/hadeth_details/hadeth_details.dart';
import 'package:islamicproject/ui/utils/app_assets.dart';
import 'package:islamicproject/ui/utils/app_colors.dart';
import 'package:islamicproject/ui/utils/app_styles.dart';
import 'package:islamicproject/ui/utils/constans.dart';

import '../../../../../models/hadeth_model.dart';

class Ahadeth extends StatefulWidget {
  static List<Hadeth> hadethList = [];
  const Ahadeth({super.key});

  @override
  State<Ahadeth> createState() => _AhadethState();
}

class _AhadethState extends State<Ahadeth> {
  @override
  void initState() {
    readHadethFile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Image.asset(AppAssets.ahadethTabLogo),
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
                          'Ahadeth',
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
                  Expanded(child: buildHadethList()),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future readHadethFile() async {
    String ahadethFileContent =
        await rootBundle.loadString(Constant.hadethFilePath);
    List<String> ahadethAsString = ahadethFileContent.split('#\r\n');
    for (int i = 0; i < ahadethAsString.length; i++) {
      String hadeth = ahadethAsString[i];
      List<String> hadethLines = hadeth.split('\n');
      String hadethName = hadethLines[0];
      hadethLines.removeAt(0);
      String hadethContent = hadethLines.join();
      Ahadeth.hadethList.add(Hadeth(hadethName.trim(), hadethContent));
    }
    setState(() {});
  }

  Widget buildHadethList() => Ahadeth.hadethList.isEmpty
      ? const CircularProgressIndicator()
      : ListView.builder(
          itemCount: Ahadeth.hadethList.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Navigator.pushNamed(context, HadethDetails.routeName,
                  arguments: Ahadeth.hadethList[index]);
            },
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    Ahadeth.hadethList[index].title,
                    style: AppStyle.titleTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
}
