import 'package:clot/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const _fontFamily = "Inter";

  static final _lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: ThemeColors.primaryColor,
      onPrimary: Colors.white,
      secondary: Color(0xFF8E8E8E),
      onSecondary: const Color(0xFF272727),
      tertiary: Color(0xFFF4F4F4),
      onTertiary: const Color(0xFF272727),
      background: Colors.white,
      onBackground: const Color(0xFF272727),
      surface: Colors.white,
      onSurface: const Color(0xFF272727),
    ),
  );

  static final _darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: ThemeColors.primaryColor,
      onPrimary: Colors.white,
      secondary: Color.fromARGB(255, 15, 15, 15),
      onSecondary: Colors.white,
      tertiary: Color.fromARGB(255, 25, 25, 25),
      background: Color.fromARGB(255, 35, 35, 35),
      onBackground: Colors.white,
      surface: Color.fromARGB(255, 35, 35, 35),
      onSurface: Colors.white,
    ),
  );

  static ThemeData _globalTheme(
      Brightness brightness, ColorScheme colorScheme) {
    return ThemeData(
      brightness: brightness,
      colorScheme: colorScheme,
      fontFamily: _fontFamily,
      scaffoldBackgroundColor: colorScheme.background,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.background,
        foregroundColor: colorScheme.onBackground,
        titleTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: colorScheme.onBackground,
        ),
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: colorScheme.background,
        selectedIconTheme: IconThemeData(
          color: colorScheme.onPrimary,
        ),
        unselectedIconTheme: IconThemeData(
          color: colorScheme.secondary,
        ),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          // H1
          fontSize: 32,
          color: colorScheme.onSurface,
        ),
        displayMedium: TextStyle(
          // H2
          fontSize: 24,
          color: colorScheme.onSurface,
        ),
        displaySmall: TextStyle(
          // H3
          fontSize: 16,
          color: colorScheme.onSurface,
        ),
        headlineMedium: TextStyle(
          // H4
          fontSize: 12,
          color: colorScheme.onSurface,
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
          backgroundColor: MaterialStatePropertyAll(colorScheme.primary),
          foregroundColor: MaterialStatePropertyAll(colorScheme.onPrimary),
          textStyle: MaterialStatePropertyAll(
            TextStyle(
              color: colorScheme.onPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ),
    );
  }

  ThemeData getTheme(String theme) {
    switch (theme) {
      case "light":
        return _globalTheme(_lightTheme.brightness, _lightTheme.colorScheme);
      case "dark":
        return _globalTheme(_darkTheme.brightness, _darkTheme.colorScheme);
    }

    return ThemeData();
  }
}

// class AppTheme {
//   static const _fontFamily = "Inter";
//   static const _textTheme = TextTheme(
//     titleLarge: TextStyle(
//       fontSize: 32,
//       fontWeight: FontWeight.bold,
//       color: ThemeColors.primaryTextColor,
//     ),
//     titleMedium: TextStyle(
//       fontSize: 24,
//       fontWeight: FontWeight.bold,
//       color: ThemeColors.primaryTextColor,
//     ),
//     titleSmall: TextStyle(
//       fontSize: 16,
//       fontWeight: FontWeight.bold,
//       color: ThemeColors.primaryTextColor,
//     ),
//     labelMedium: TextStyle(
//       fontSize: 12,
//       fontWeight: FontWeight.normal,
//       color: ThemeColors.primaryTextColor,
//     ),
//   );

//   ThemeData get theme {
//     return ThemeData(
//       scaffoldBackgroundColor: ThemeColors.backgroundColor,
//       primarySwatch: ThemeColors.primarySwatch,
//       primaryColor: ThemeColors.primaryColor,
//       appBarTheme: const AppBarTheme(
//         foregroundColor: ThemeColors.primaryInvertedColor,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//         titleTextStyle: TextStyle(
//           color: ThemeColors.primaryTextColor,
//           fontSize: 16,
//           fontWeight: FontWeight.bold,
//           fontFamily: _fontFamily,
//         ),
//       ),
//       textButtonTheme: TextButtonThemeData(
//         style: ButtonStyle(
//           padding: const MaterialStatePropertyAll(
//             EdgeInsets.zero,
//           ),
//           minimumSize: const MaterialStatePropertyAll(
//             Size(
//               50,
//               50,
//             ),
//           ),
//           backgroundColor: MaterialStatePropertyAll(ThemeColors.primaryColor),
//           foregroundColor: const MaterialStatePropertyAll(Colors.white),
//           shape: MaterialStatePropertyAll(
//             RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(100),
//             ),
//           ),
//         ),
//       ),
//       textTheme: _textTheme,
//       fontFamily: _fontFamily,
//       colorScheme: const ColorScheme.light(),
//     );
//   }
// }
