import 'package:flutter/material.dart';

import '../constants/dimensions.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF090817),
    secondary: Color(0xFFf8f8ff),
    onPrimary: Color(0xFF44b1c2),
    onSecondary: Color(0xFF5a5b61),
    surface: Color(0xFFc0c1c7),
    primaryContainer: Color(0xFF090817),
  ),
);

ThemeData darkTheme = ThemeData(



  scaffoldBackgroundColor: const Color(0xFF090817),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF090817),
    primaryContainer: Colors.white,
    secondary: Color(0xFF090817),
    onPrimary: Color(0xFF44b1c2),
    onSecondary: Color(0xFF5a5b61),
    surface: Color(0xFFc0c1c7),
  ),
  datePickerTheme: const DatePickerThemeData(
    // header bg color
  ),
);

BoxDecoration containerDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 2,
        blurRadius: 1,
        offset: const Offset(0, 1),
      ),
    ],
  );
}