// ignore_for_file: must_be_immutable, avoid_print, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamicproject/models/sura_details_model.dart';
import 'package:islamicproject/ui/provider/theme_provider.dart';
import 'package:islamicproject/ui/utils/app_colors.dart';
import 'package:islamicproject/ui/widgets/app_scaffold.dart';
import 'package:provider/provider.dart';

class SuraDetails extends StatefulWidget {
  const SuraDetails({super.key});
  static const String routeName = 'sura_details';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  late SuraDetailsArgs args;

  String fileContent = '';
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (fileContent.isEmpty) {
      readFileO();
    }
    return AppScaffold(
      appBarTitle: 'islami',
      body: fileContent.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColor.primary,
              ),
            )
          : Center(
              child: Container(
                margin: const EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height * 1,
                width: MediaQuery.of(context).size.width * 1,
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
                        Text('سورة ${args.suraNames}',
                            style: themeProvider.isDarkTheme
                                ? const TextStyle(
                                    color: AppColor.primary, fontSize: 26)
                                : const TextStyle(
                                    color: AppColor.accent, fontSize: 26)),
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
                          color: AppColor.accent),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(fileContent,
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: themeProvider.isDarkTheme
                                ? const TextStyle(
                                    color: AppColor.primary, fontSize: 26)
                                : const TextStyle(
                                    color: AppColor.accent, fontSize: 26)),
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
