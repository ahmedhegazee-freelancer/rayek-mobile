import 'package:flutter/cupertino.dart';
import 'package:platform/platform.dart';

import '../bloc/dark_light_bloc/cubit.dart';

class AppConstants{
  final BuildContext? context;

  AppConstants({this.context});

  ///CONSTANTS
  static  const String currencyCoin='currency_coin';

  ///sharedPreferences
  static  const String language='lang';
  static  const String token='token';
  static  const String isFirst='isFirst';
  static  const String themeKey='theme';
  static  const String darkMode='dark';
  static  const String lightMode='light';

  // Bloc
  static ThemeCubit themeBloc = ThemeCubit();

  /// Device Info
  static  const LocalPlatform  platform= LocalPlatform();
}