import 'dart:convert';
import 'package:flutter/services.dart';

class LocalizationLoader {
  static Future<Map<String, String>> load(String langCode) async {
    final jsonString =
        await rootBundle.loadString('assets/lang/$langCode.json');

    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    return jsonMap.map(
      (key, value) => MapEntry(key, value.toString()),
    );
  }
}
