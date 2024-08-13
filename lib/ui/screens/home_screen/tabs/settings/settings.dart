// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:islamicproject/ui/provider/language_provider.dart';
import 'package:islamicproject/ui/utils/app_colors.dart';
import 'package:islamicproject/ui/utils/app_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isDarktheme = false;
  late LanguageProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
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
        value: provider.local,
        isExpanded: true,
        items: const [
          DropdownMenuItem(value: 'ar', child: Text('العربية')),
          DropdownMenuItem(value: 'en', child: Text('English')),
        ],
        onChanged: (value) {
          provider.local = value ?? provider.local;
          provider.notifyListeners;
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
