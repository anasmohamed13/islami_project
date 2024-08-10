import 'package:flutter/material.dart';
import 'package:islamicproject/ui/utils/app_styles.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String selectedLanguage = 'en';
  bool isDarktheme = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Settings',
              style: AppStyle.titleTextStyle,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'language',
          style: AppStyle.titleTextStyle.copyWith(fontSize: 20),
        ),
        buildLanguageDropDown(),
        const SizedBox(
          height: 20,
        ),
        const Text('theme App'),
        buildThemeSwitch(),
      ],
    );
  }

  Widget buildLanguageDropDown() => DropdownButton(
        value: selectedLanguage,
        items: const [
          DropdownMenuItem(value: 'ar', child: Text('العربية')),
          DropdownMenuItem(value: 'en', child: Text('English')),
        ],
        onChanged: (value) {
          selectedLanguage = value ?? selectedLanguage;
          setState(() {});
        },
      );

  buildThemeSwitch() => Switch(
      value: isDarktheme,
      onChanged: (value) {
        isDarktheme = value;
        setState(() {});
      });
}
