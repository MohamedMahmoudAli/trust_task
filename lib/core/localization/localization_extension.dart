import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'localization_service.dart';

extension TranslateExtension on String {
  String tr(BuildContext context) {
    return context.read<LocalizationService>().translate(this);
  }
}
