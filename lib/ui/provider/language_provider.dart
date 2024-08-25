import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String local = 'en';

  void changeLang(String? val) {
    local = val ?? local;
    notifyListeners();
  }
}
