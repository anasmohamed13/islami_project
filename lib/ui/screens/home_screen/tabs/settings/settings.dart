import 'package:flutter/material.dart';
import 'package:islamicproject/ui/utils/app_colors.dart';
import 'package:islamicproject/ui/utils/app_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  static String selectedLanguage = 'en';
  bool isDarktheme = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.settings,
                style: AppStyle.titleTextStyle,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            AppLocalizations.of(context)!.language,
            style: AppStyle.titleTextStyle.copyWith(fontSize: 20),
          ),
          buildLanguageDropDown(),
          const SizedBox(
            height: 20,
          ),
          buildThemeSwitch(),
        ],
      ),
    );
  }

  Widget buildLanguageDropDown() => DropdownButton(
        isExpanded: true,
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

  Widget buildThemeSwitch() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.mode,
            style: AppStyle.titleTextStyle.copyWith(fontSize: 20),
          ),
          Switch(
              activeColor: AppColor.primaryColor,
              value: isDarktheme,
              onChanged: (value) {
                isDarktheme = value;
                setState(() {});
              }),
        ],
      );
}
