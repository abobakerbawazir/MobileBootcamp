import 'package:flutter/material.dart';

ThemeData light = ThemeData(
    brightness: Brightness.light,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.horizontal(),
        ),
        backgroundColor: Color.fromARGB(66, 42, 86, 191),
        largeSizeConstraints: BoxConstraints(maxHeight: 100)),
    textTheme: TextTheme(
      titleMedium: TextStyle(
          color: Colors.red, fontSize: 20, fontWeight: FontWeight.w300),
      titleLarge: TextStyle(
          color: Colors.purple, fontSize: 30, fontWeight: FontWeight.w700),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.amber,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0))),
    ));
ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.horizontal(),
      ),
      backgroundColor: Color.fromARGB(66, 76, 71, 206),
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
          color: Colors.brown, fontSize: 20, fontWeight: FontWeight.w300),
      titleLarge: TextStyle(
          color: Color.fromARGB(255, 77, 172, 192),
          fontSize: 30,
          fontWeight: FontWeight.w700),
    ),
    appBarTheme: AppBarTheme(backgroundColor: Colors.green),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple)));
