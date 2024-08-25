import 'package:flutter/material.dart';
import 'package:islamicproject/ui/utils/app_assets.dart';

class Sebha extends StatelessWidget {
  const Sebha({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppAssets.headSebhaLogo),
        Center(child: Image.asset(AppAssets.bodySebhaLogo)),
        Container(),
        ElevatedButton(onPressed: () {}, child: const Text('سبحان الله')),
      ],
    );
  }
}
