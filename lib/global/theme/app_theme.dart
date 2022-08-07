// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum AppTheme {
  darkMode,
  lightMode,
}

final appThemeData = {
  AppTheme.darkMode: ThemeData(
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.black,
    ),
    cardTheme: CardTheme(color: Color(0xFF1E1E1E)),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.grey),
      labelStyle: TextStyle(color: Colors.white),
    ),
    brightness: Brightness.dark,
    backgroundColor: Colors.black,
    textTheme: TextTheme(
        headline2: TextStyle(color: Colors.white),
        headline6: TextStyle(color: Colors.grey)),
    hoverColor: Colors.white.withOpacity(0.1),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.pinkAccent,
      selectionColor: Colors.pinkAccent,
      selectionHandleColor: Colors.pinkAccent,
    ),
  ),
  AppTheme.lightMode: ThemeData(
      appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.white),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.grey),
        labelStyle: TextStyle(color: Colors.white),
      ),
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      textTheme: TextTheme(
          headline2: TextStyle(color: Color(0xFF3F3C36)),
          headline6: TextStyle(color: Color(0xFF3F3C36).withOpacity(0.5))),
      hoverColor: Color(0xFFF2F5FA),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
          .copyWith(secondary: Colors.pinkAccent),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.pinkAccent,
        selectionColor: Colors.pinkAccent,
        selectionHandleColor: Colors.pinkAccent,
      )),
};
