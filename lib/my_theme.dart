import 'package:flutter/material.dart';

import 'package:instagram_clone/utils/constants.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    brightness: Brightness.light,
    primary: Color(0xFF0095F6),
    onPrimary: Colors.white,
    surface: Colors.white,
    onSurface: Color.fromRGBO(0, 0, 0, 0.8),
    error: Color(0xFFBA1A1A),
    onError: Colors.white,
    secondary: Color(0xFF737373),
    onSecondary: Colors.black12,
  ),

  /// https://m3.material.io/styles/typography/applying-type
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontFamily: Constants.fontInter,
      fontWeight: FontWeight.w500,
      fontSize: 20.0,
      height: 1.5,
      color: Color.fromRGBO(0, 0, 0, 0.8),
    ),
    bodyMedium: TextStyle(
      fontFamily: Constants.fontInter,
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
      height: 1.2,
      color: Color.fromRGBO(0, 0, 0, 0.8),
    ),
    bodySmall: TextStyle(
      fontFamily: Constants.fontInter,
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
      height: 1.5,
      color: Color.fromRGBO(0, 0, 0, 0.8),
    ),
    displayLarge: TextStyle(
      fontFamily: Constants.fontBillabong,
      fontWeight: FontWeight.w400,
      fontSize: 32.0,
      height: 1.6,
      color: Color.fromRGBO(0, 0, 0, 0.8),
    ),
    headlineLarge: TextStyle(
      fontFamily: Constants.fontInter,
      fontWeight: FontWeight.w700,
      fontSize: 24.0,
      height: 1.3,
      color: Color.fromRGBO(0, 0, 0, 0.8),
    ),
    headlineSmall: TextStyle(
      fontFamily: Constants.fontInter,
      fontWeight: FontWeight.w600,
      fontSize: 18.0,
      height: 1.2,
      color: Color.fromRGBO(0, 0, 0, 0.8),
    ),
    labelLarge: TextStyle(
      fontFamily: Constants.fontInter,
      fontWeight: FontWeight.w500,
      fontSize: 14.0,
      height: 1.2,
      color: Color.fromRGBO(0, 0, 0, 0.8),
    ),
    labelSmall: TextStyle(
      fontFamily: Constants.fontInter,
      fontWeight: FontWeight.w400,
      fontSize: 12.0,
      height: 1.2,
      color: Color.fromRGBO(0, 0, 0, 0.8),
    ),
    titleLarge: TextStyle(
      fontFamily: Constants.fontInter,
      fontWeight: FontWeight.w600,
      fontSize: 20.0,
      height: 1.4,
      color: Color.fromRGBO(0, 0, 0, 0.8),
    ),
    titleSmall: TextStyle(
      fontFamily: Constants.fontInter,
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
      height: 1.3,
      color: Color.fromRGBO(0, 0, 0, 0.8),
    ),
  ),

  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      alignment: Alignment.center,
      backgroundColor: WidgetStateProperty.resolveWith<Color>(
        (states) {
          if (states.contains(WidgetState.hovered)) {
            return const Color(0xFF737373).withValues(alpha: 0.4);
          }
          return const Color(0xFF737373);
        },
      ),
      foregroundColor: WidgetStateProperty.all<Color>(const Color(0xFF737373)),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      textStyle: WidgetStateProperty.all(
        const TextStyle(
          fontFamily: Constants.fontInter,
          fontWeight: FontWeight.w500,
          fontSize: 14.0,
          height: 1.2,
        ),
      ),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      alignment: Alignment.center,
      backgroundColor: WidgetStateProperty.all<Color>(
        Colors.transparent,
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      iconColor: WidgetStateProperty.all(
        Colors.black12,
      ),
      iconSize: WidgetStateProperty.all(14.0),
    ),
  ),
);
