import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trust_task/core/injection/injection_container.dart' as di;
import 'package:trust_task/core/localization/localization_extension.dart';

import 'core/localization/localization_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setupDependencies();

  final localizationService = LocalizationService();
  await localizationService.changeLanguage('en');

  runApp(
    ChangeNotifierProvider.value(
      value: localizationService,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale(context.watch<LocalizationService>().langCode),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('app_title'.tr(context))),
      body: Center(child: Text('home_welcome'.tr(context))),
    );
  }
}
