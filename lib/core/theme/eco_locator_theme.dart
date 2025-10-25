import 'package:flutter/material.dart';

class EcoLocatorTheme {
  static final ThemeData dark = ThemeData.dark().copyWith(
    primaryColor: Color(0xFF121212),
    colorScheme: ColorScheme.dark(primary: Color(0xFF121212)),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Color(0xFF121212)),
    dialogTheme: DialogThemeData(backgroundColor: Color(0xFF121212)),
  );

  static final ThemeData light = ThemeData.light().copyWith(
    primaryColor: Colors.white,
    colorScheme: ColorScheme.light(primary: Colors.white),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white),
    dialogTheme: DialogThemeData(backgroundColor: Colors.white),
  );
}