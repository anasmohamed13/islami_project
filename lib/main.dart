import 'package:flutter/material.dart';
import 'package:islamicproject/ui/screens/hadeth_details/hadeth_details.dart';
import 'package:islamicproject/ui/screens/home_screen/home_screen.dart';
import 'package:islamicproject/ui/screens/splashscreen/spalsh_screen.dart';
import 'package:islamicproject/ui/screens/sura_details/sura_details.dart';

void main() {
  runApp(const IslamicApp());
}

class IslamicApp extends StatelessWidget {
  const IslamicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        SuraDetails.routeName: (context) => const SuraDetails(),
        HadethDetails.routeName: (context) => const HadethDetails(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
