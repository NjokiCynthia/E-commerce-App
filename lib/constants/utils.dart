import 'package:ecommerce/constants/color_constants.dart';
import 'package:ecommerce/constants/strings.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static var darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryDarkColor,
      scaffoldBackgroundColor: backColor,
      dialogBackgroundColor: primaryDarkColor,
      fontFamily: Strings.fontName,
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: primaryDarkColor),
      appBarTheme:
          const AppBarTheme(backgroundColor: primaryDarkColor, elevation: 0),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            fontFamily: Strings.fontName),
        displayMedium: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            fontFamily: Strings.fontName),
        displaySmall: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
            fontFamily: Strings.fontName),
        headlineMedium: TextStyle(
            fontSize: 14.0, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
        headlineLarge: TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.w700,
            fontFamily: Strings.fontName),
        headlineSmall: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            fontFamily: Strings.fontName),
        titleLarge: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: Strings.fontName),
        bodyLarge: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            fontFamily: Strings.fontName),
        bodyMedium:
            TextStyle(color: textColor, fontSize: 14.0, height: 1.428571),
      ).apply(bodyColor: textColor));
}

InputDecoration customInputDecoration({required String labelText}) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white,
    labelText: labelText,
    labelStyle:
        MyTheme.darkTheme.textTheme.bodyLarge!.copyWith(color: Colors.grey),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.shade300,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
  );
}
