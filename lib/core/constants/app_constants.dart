import 'package:flutter/cupertino.dart';
import 'package:platform/platform.dart';

class AppConstants{
  final BuildContext? context;

  AppConstants({this.context});

  ///CONSTANTS
  static  const String currency_coin='currency_coin';

  ///sharedPreferences
  static  const String language='lang';
  static  const String token='token';
  static  const String isFirst='isFirst';

  /// Device Info
  static  const LocalPlatform  platform= LocalPlatform();
}