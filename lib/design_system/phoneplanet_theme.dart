import 'package:flutter/material.dart';
import 'package:phoneplanet/design_system/phoneplanet_colors.dart';

const phoneplanetPrimaryColor = 0xFF0f1387;

abstract class PhoneplanetTheme {
  static ThemeData light = ThemeData(
    primarySwatch: PhoneplanetColors.primaryColor,
    scaffoldBackgroundColor: PhoneplanetColors.backgroundScaffoldGrey,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        // borderSide: BorderSide.none,
      ),
      // filled: true,
      // fillColor: PhoneplanetColors.lightGrey,
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStatePropertyAll(0),
        minimumSize: MaterialStatePropertyAll(
          Size(30, 50),
        ),
      ),
    ),
  );
}
