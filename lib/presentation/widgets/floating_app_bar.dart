import 'dart:io';

import 'package:eco_locator/core/enums/theme_status.dart';
import 'package:eco_locator/presentation/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FloatingAppBar extends StatelessWidget {
  final ThemeStatus themeStatus;

  const FloatingAppBar({super.key, required this.themeStatus});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = context.watch<ThemeProvider>();

    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(left: 24, right: 24, top: 72),
      decoration: BoxDecoration(
        color: themeStatus == ThemeStatus.light ? Colors.white.withValues(alpha: 0.1) : Colors.black.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
          width: 1.2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         SizedBox(width: 24),
          Text(
            "Eco Locator",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          GestureDetector(
            onTap: () => themeProvider.toggleTheme(),
            child: Icon(
              themeProvider.currentThemeStatus == ThemeStatus.light
                  ? Icons.light_mode
                  : Icons.dark_mode_outlined,
              size: 24,
              color: themeProvider.currentThemeStatus == ThemeStatus.light
                  ? Colors.amber.shade700
                  : Colors.blueGrey.shade100,
            ),
          ),
        ],
      ),
    );
  }
}
