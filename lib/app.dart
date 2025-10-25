import 'package:eco_locator/presentation/pages/eco_map_page/eco_map_page.dart';
import 'package:eco_locator/presentation/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return MaterialApp(
      title: 'Eco Locator',
      theme: themeProvider.themeData,
      home: EcoMapPage(),
    );
  }
}