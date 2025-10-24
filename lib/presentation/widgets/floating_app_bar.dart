import 'dart:io';

import 'package:flutter/material.dart';

class FloatingAppBar extends StatelessWidget {
  const FloatingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(left: 24, right: 24, top: 72),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
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
          GestureDetector(
            onTap: () => {},
            child: Icon(
              Platform.isAndroid
                  ? Icons.arrow_back
                  : Icons.chevron_left_rounded,
              color: Colors.white,
            ),
          ),
          Text(
            "Eco Locator",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 24),
        ],
      ),
    );
  }
}
