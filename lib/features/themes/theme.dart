import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Color.fromRGBO(248, 249, 250, 1),
    primary: Color.fromRGBO(52, 58, 64, 1),
    secondaryContainer: Color.fromRGBO(215, 215, 215, 1)
  )
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Color.fromRGBO(37, 36, 35, 1),
    primary: Color.fromRGBO(203, 197, 191, 1),
    secondaryContainer: Color.fromRGBO(50, 50, 50, 1)
  )
);