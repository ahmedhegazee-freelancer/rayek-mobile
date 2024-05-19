import 'package:flutter/material.dart';
import 'package:rayik/core/constants/color_manager.dart';
import 'package:rayik/core/theme/fonts_style.dart';
import 'package:shimmer/shimmer.dart';
import 'package:rayik/core/router/router.dart';

import '../../core/constants/app_constants.dart';
import '../on_boarding/on_boarding_language/form.dart';



class SplashForm extends StatefulWidget {
  const SplashForm({super.key});

  @override
  State<SplashForm> createState() => _SplashFormState();
}

class _SplashFormState extends State<SplashForm> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () {
      MagicRouter.navigateTo(const LanguageOnBoardingView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.blackTextColor,
      body: Center(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '.',
                style: AppTextStyle.splashFontStyle.copyWith(
                  color: ColorManager.primaryColor,
                  )
              ),
              Shimmer.fromColors(
                baseColor: ColorManager.whiteTextColor,
                highlightColor: ColorManager.blackTextColor,

                child: Text(
                  AppConstants.appName,
                  style: AppTextStyle.splashFontStyle
                )
              ),
            ],
          ),
        ),

        )

    );
  }
}
