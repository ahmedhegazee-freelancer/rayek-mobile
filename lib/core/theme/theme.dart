import 'package:flutter/material.dart';

import '../constants/color_manager.dart';
import '../constants/dimensions.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  fontFamily: "Cairo",
  colorScheme: ThemeData().colorScheme.copyWith(
    primary: ColorManager.primaryColor,
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