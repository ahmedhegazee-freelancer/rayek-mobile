import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/dark_light_bloc/cubit.dart';
import '../../../core/constants/dimensions.dart';

BoxDecoration containerDecoration(BuildContext context) {
  ThemeState themeState = context.watch<ThemeCubit>().state;
  return BoxDecoration(
    color: themeState == ThemeState.light ? Colors.white : Colors.transparent,
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
