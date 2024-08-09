// ignore_for_file: must_be_immutable, avoid_print, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamicproject/models/sura_details_model.dart';
import 'package:islamicproject/ui/utils/app_colors.dart';
import 'package:islamicproject/ui/utils/app_styles.dart';
import 'package:islamicproject/ui/widgets/app_scaffold.dart';

class SuraDetails extends StatefulWidget {
  const SuraDetails({super.key});
  static const String routeName = 'sura_details';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  late SuraDetailsArgs args;

  String fileContent = '';

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (fileContent.isEmpty) {
      readFileO();
    }
    return AppScaffold(
      appBarTitle: 'islami',
      body: fileContent.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColor.primaryColor,
              ),
            )
          : Center(
              child: Container(
                margin: const EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColor.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'سورة ${args.suraNames}',
                          style: const TextStyle(
                              fontSize: 24,
                              color: AppColor.accentcolor,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.play_circle_rounded,
                          size: 30,
                        )
                      ],
                    ),
                    Container(
                      height: 2,
                      width: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: AppColor.accentcolor),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SingleChildScrollView(
                      child: Expanded(
                        child: Text(
                          fileContent,
                          textDirection: TextDirection.rtl,
                          style: AppStyle.titleTextStyle.copyWith(fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }

  Future readFileO() async {
    fileContent =
        await rootBundle.loadString('assets/files/quran/${args.fileNames}');
    List<String> fileLines = fileContent.split('\n');
    fileLines = fileLines.where((line) => line.trim().isNotEmpty).toList();
    for (int i = 0; i < fileLines.length; i++) {
      fileLines[i] += '(${i + 1})';
    }

    fileContent = fileLines.join();
    setState(() {});
  }
}
