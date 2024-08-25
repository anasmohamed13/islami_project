import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:islamicproject/ui/provider/language_provider.dart';
import 'package:islamicproject/ui/provider/theme_provider.dart';
import 'package:islamicproject/ui/screens/hadeth_details/hadeth_details.dart';
import 'package:islamicproject/ui/screens/home_screen/home_screen.dart';
import 'package:islamicproject/ui/screens/splashscreen/spalsh_screen.dart';
import 'package:islamicproject/ui/screens/sura_details/sura_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamicproject/ui/utils/app_styles.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: ChangeNotifierProvider(
        create: (context) => LanguageProvider(),
        child: const IslamicApp(),
      ),
    ),
  );
}

class IslamicApp extends StatelessWidget {
  const IslamicApp({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageProvider languageprovider = Provider.of(context);
    ThemeProvider themeProvider = Provider.of(context);
    return MaterialApp(
      theme: AppStyle.lightTheme,
      darkTheme: AppStyle.darkTheme,
      themeMode: themeProvider.currentTheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale(languageprovider.local),
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetails.routeName: (context) => const SuraDetails(),
        HadethDetails.routeName: (context) => const HadethDetails(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
