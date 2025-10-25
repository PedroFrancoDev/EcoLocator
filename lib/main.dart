import 'package:eco_locator/app.dart';
import 'package:eco_locator/presentation/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(), 
      child: App(),
    ),
  );
}
