import 'package:flutter/material.dart';

ThemeData light_theme = ThemeData(
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.green,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white)),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
          color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),
        labelSmall: TextStyle( color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.green,
    ),
    colorSchemeSeed: Colors.green,
 );


ThemeData dark_theme = ThemeData(
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white)),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        labelSmall: TextStyle( color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)
    ),
    brightness: Brightness.dark,

    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.blue),
    colorSchemeSeed: Colors.blue);
