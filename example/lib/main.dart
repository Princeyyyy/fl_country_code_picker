import 'package:fl_country_code_picker/fl_country_code_picker.dart' as flc;
import 'package:flutter/material.dart';

import 'demo/demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // supportedLocales: flc.supportedLocales.map(Locale.new),
      supportedLocales:
          flc.CountryLocalizations.supportedLocales.map(Locale.new),
      localizationsDelegates: const [
        flc.CountryLocalizations.delegate,
      ],
      home: const DemoPage(),
    );
  }
}
