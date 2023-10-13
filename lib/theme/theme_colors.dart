import 'package:flutter/material.dart';

class ThemeColors {
  static const primaryTextColor = primaryInvertedColor;
  static final primarySwatch = MaterialColor(
    Colors.deepPurpleAccent.hashCode,
    const <int, Color>{
      50: Color(0xFFB6A3FF),
      100: Color(0xFFA791FF),
      200: Color(0xFF987EFF),
      300: Color(0xFF896CFF),
      400: Color(0xFF7B59FF),
      500: Color(0xFF6C47FF),
      600: Color(0xFF6140E6),
      700: Color(0xFF5639CC),
      800: Color(0xFF4C32B3),
      900: Color(0xFF412B99),
    },
  );
  static final primaryColor = primarySwatch.shade500;
  static const primaryInvertedColor = Color(0xFF272727);

  static const backgroundColor = Colors.white;
}
