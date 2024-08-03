import 'package:flutter/material.dart';
import 'package:islamicproject/ui/screens/home_screen/home_screen.dart';
import 'package:islamicproject/ui/screens/splashscreen/spalsh_screen.dart';
import 'package:islamicproject/ui/utils/app_assets.dart';

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
        SplashScreen.RouteName: (context) => const SplashScreen(),
        HomeScreen.RouteName: (context) => const HomeScreen()
      },
      initialRoute: SplashScreen.RouteName,
    );
  }
}
