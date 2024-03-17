import 'package:flutter/material.dart';

import '../constants/color_manager.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  fontFamily: "Cairo",
  colorScheme: ThemeData().colorScheme.copyWith(
    primary: ColorManager.primaryColor,
  ),
);