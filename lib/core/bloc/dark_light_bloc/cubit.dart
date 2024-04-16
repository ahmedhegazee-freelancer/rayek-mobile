import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rayik/core/constants/app_constants.dart';

import '../../helper/cache_helper.dart';

enum ThemeState { light, dark }

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.light);

  void initTheme() async {
    final theme = CacheHelper.getData(key: AppConstants.themeKey);
    if (theme != null) {
      if (theme == AppConstants.darkMode) {
        emit(ThemeState.dark);
      } else {
        emit(ThemeState.light);
      }
    } else {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      if (brightness == Brightness.dark) {
        emit(ThemeState.dark);
      } else {
        emit(ThemeState.light);
      }
    }
  }

  void toLightTheme() {
    CacheHelper.setData(key: AppConstants.themeKey, value: AppConstants.lightMode );
    emit(ThemeState.light);
  }

  void toDarkTheme() {
    CacheHelper.setData(key: AppConstants.themeKey, value: AppConstants.darkMode);
    emit(ThemeState.dark);
  }
}