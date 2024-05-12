import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rayik/core/bloc/bloc_observer.dart';
import 'package:rayik/core/bloc/dark_light_bloc/cubit.dart';
import 'package:rayik/features/splash/form.dart';
import 'core/bloc/language_cubit/language_cubit.dart';
import 'core/bloc/language_cubit/language_states.dart';
import 'core/helper/cache_helper.dart';
import 'core/router/router.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart' as flc;

import 'core/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Bloc.observer = AppBlocObserver();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      saveLocale: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LanguageCubit>(
            create: (context) => LanguageCubit(),
          ),
          BlocProvider<ThemeCubit>(
            create:  (context) {
              final themeCubit = ThemeCubit();
              themeCubit.initTheme();
              return themeCubit;
            },
          ),
        ],
        child: const MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              return BlocConsumer<LanguageCubit, LanguageState>(
                listener: (context, state) {
                  // Do something based on the LanguageState
                },
                builder: (context, state) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false, // debug banner
                    supportedLocales: flc.CountryLocalizations.supportedLocales
                        .map(Locale.new),
                    title: 'Rayik Consulting App',
                    theme: themeState == ThemeState.light
                        ? lightTheme.copyWith(
                            textTheme: lightTheme.textTheme.apply(
                              fontFamily: context.locale == const Locale('ar')
                                  ? 'Arb'
                                  : 'UberMove',
                            ),
                          )
                        : darkTheme.copyWith(
                            textTheme: darkTheme.textTheme.apply(
                              fontFamily: context.locale == const Locale('ar')
                                  ? 'Arb'
                                  : 'UberMove',
                            ),
                          ),
                    localizationsDelegates: context.localizationDelegates,
                    locale: context.locale,
                    builder: DevicePreview.appBuilder,
                    navigatorKey: navigatorKey,
                    home: const SplashForm(),
                  );
                },
              );
            },
          );
        });
  }
}
