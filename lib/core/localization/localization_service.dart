import 'package:flutter/material.dart';
import 'localization_loader.dart';

class LocalizationService extends ChangeNotifier {
  String _langCode = 'en';
  Map<String, String> _translations = {};

  String get langCode => _langCode;

  Future<void> changeLanguage(String code) async {
    _langCode = code;
    _translations = await LocalizationLoader.load(code);
    notifyListeners();
  }

  String translate(String key) {
    return _translations[key] ?? key;
  }
}
