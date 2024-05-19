import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rayik/core/constants/app_constants.dart';
import 'package:rayik/core/constants/color_manager.dart';
import 'package:rayik/core/constants/dimensions.dart';
import 'package:rayik/core/theme/fonts_style.dart';
import 'package:rayik/features/on_boarding/form.dart';
import 'package:rayik/widgets/custom_button.dart';

import '../../../core/bloc/dark_light_bloc/cubit.dart';
import '../../../core/bloc/language_cubit/language_cubit.dart';
import '../../../core/constants/strings.dart';
import '../../../core/router/router.dart';

class LanguageOnBoardingView extends StatelessWidget {
  const LanguageOnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(
        left: Dimensions.defaultPadding.w,
        right: Dimensions.defaultPadding.w,
        top: Dimensions.defaultPadding.h,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 20.h,
          ),
          // Animated Text Kit
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  children: [
                    SizedBox(
                      height: 60.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: CircleAvatar(
                              radius: 10.r,
                              backgroundColor: ColorManager.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText(
                          AppConstants.appName,
                          textStyle: AppTextStyle.titleStyle.copyWith(
                            fontSize: 80.sp,
                            fontFamily: AppConstants.englishFont,
                          ),
                          speed: const Duration(milliseconds: 320),
                        ),
                      ],
                      totalRepeatCount: 1,
                      pause: const Duration(milliseconds: 200),
                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.h,
                  width: 6.w,
                ),
                Text(
                  Strings.selectLanguage.tr(),
                  style: AppTextStyle.h1,
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                    width: 150.w,
                    onTap: () {
                      //context.setLocale(const Locale('ar'));
                      MagicRouter.navigateAndPopAll(const OnBoardingView());
                      context.read<LanguageCubit>().isSelected(context, false);
                    },
                    text: 'العربية'),
                CustomButton(
                    width: 150.w,
                    color: ColorManager.greyButtonColor,
                    txtColor:
                        context.watch<ThemeCubit>().state == ThemeState.dark
                            ? ColorManager.whiteTextColor
                            : ColorManager.greyTextColor,
                    onTap: () {
                      context.setLocale(const Locale('en'));
                      MagicRouter.navigateAndPopUntilFirstPage(
                          const OnBoardingView());
                      context.read<LanguageCubit>().isSelected(context, true);
                    },
                    text: 'English'),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
          ])
        ],
      ),
    ));
  }
}
