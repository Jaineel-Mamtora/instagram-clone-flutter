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
    onSurface: Colors.black12,
    error: Color(0xFFBA1A1A),
    onError: Colors.white,
    secondary: Color(0xFF737373),
    onSecondary: Colors.black12,
  ),

  /// https://m3.material.io/styles/typography/applying-type
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontFamily: Constants.fontRoboto,
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
      height: 1.5,
      color: Colors.black,
    ),
    bodySmall: TextStyle(
      fontFamily: Constants.fontRoboto,
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
      height: 1.5,
      color: Colors.black,
    ),
    displayLarge: TextStyle(
      fontFamily: Constants.fontBillabong,
      fontWeight: FontWeight.w400,
      fontSize: 32.0,
      height: 1.6,
      color: Colors.black,
    ),
    headlineLarge: TextStyle(
      fontFamily: Constants.fontRoboto,
      fontWeight: FontWeight.w700,
      fontSize: 24.0,
      height: 1.3,
      color: Colors.black,
    ),
    headlineSmall: TextStyle(
      fontFamily: Constants.fontRoboto,
      fontWeight: FontWeight.w600,
      fontSize: 18.0,
      height: 1.2,
      color: Colors.black,
    ),
    labelLarge: TextStyle(
      fontFamily: Constants.fontRoboto,
      fontWeight: FontWeight.w500,
      fontSize: 14.0,
      height: 1.2,
      color: Colors.black,
    ),
    labelSmall: TextStyle(
      fontFamily: Constants.fontRoboto,
      fontWeight: FontWeight.w400,
      fontSize: 12.0,
      height: 1.2,
      color: Colors.black,
    ),
    titleLarge: TextStyle(
      fontFamily: Constants.fontRoboto,
      fontWeight: FontWeight.w600,
      fontSize: 20.0,
      height: 1.4,
      color: Colors.black,
    ),
    titleSmall: TextStyle(
      fontFamily: Constants.fontRoboto,
      fontWeight: FontWeight.w500,
      fontSize: 26.0,
      height: 1.3,
      color: Colors.black,
    ),
  ),

  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      alignment: Alignment.center,
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (states) {
          if (states.contains(MaterialState.hovered)) {
            return const Color(0xFF737373).withOpacity(0.4);
          }
          return const Color(0xFF737373);
        },
      ),
      foregroundColor:
          MaterialStateProperty.all<Color>(const Color(0xFF737373)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          fontFamily: Constants.fontRoboto,
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
      backgroundColor: MaterialStateProperty.all<Color>(
        Colors.transparent,
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      iconColor: MaterialStateProperty.all(
        Colors.black12,
      ),
      iconSize: MaterialStateProperty.all(14.0),
    ),
  ),
);
