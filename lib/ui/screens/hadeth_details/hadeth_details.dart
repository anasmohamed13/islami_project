// ignore_for_file: must_be_immutable, avoid_print, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:islamicproject/models/hadeth_model.dart';
import 'package:islamicproject/ui/provider/theme_provider.dart';
import 'package:islamicproject/ui/utils/app_colors.dart';
import 'package:islamicproject/ui/widgets/app_scaffold.dart';
import 'package:provider/provider.dart';

class HadethDetails extends StatefulWidget {
  const HadethDetails({super.key});
  static const String routeName = 'hadeth_details';

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  late ThemeProvider themeProvider;
  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;

    return AppScaffold(
      appBarTitle: hadeth.title,
      body: buildHadethContent(hadeth.content),
    );
  }

  Widget buildHadethContent(String content) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: AppColor.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  content,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: themeProvider.isDarkTheme
                      ? const TextStyle(color: AppColor.primary, fontSize: 22)
                      : const TextStyle(color: AppColor.accent, fontSize: 22),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
