import 'package:clot/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const _fontFamily = "Inter";
  static const _textTheme = TextTheme(
    titleLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: ThemeColors.primaryTextColor,
    ),
    titleMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: ThemeColors.primaryTextColor,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: ThemeColors.primaryTextColor,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: ThemeColors.primaryTextColor,
    ),
  );

  ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: ThemeColors.backgroundColor,
      primarySwatch: ThemeColors.primarySwatch,
      appBarTheme: const AppBarTheme(
        foregroundColor: ThemeColors.primaryInvertedColor,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: ThemeColors.primaryTextColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: _fontFamily,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(
            EdgeInsets.zero,
          ),
          minimumSize: const MaterialStatePropertyAll(
            Size(
              50,
              50,
            ),
          ),
          backgroundColor: MaterialStatePropertyAll(ThemeColors.primaryColor),
          foregroundColor: const MaterialStatePropertyAll(Colors.white),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ),
      textTheme: _textTheme,
      fontFamily: _fontFamily,
      colorScheme: const ColorScheme.light(),
    );
  }
}
