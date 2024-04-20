import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rayik/core/bloc/dark_light_bloc/cubit.dart';
import 'package:rayik/core/constants/dimensions.dart';
import 'package:rayik/core/constants/image_manager.dart';
import 'package:rayik/core/router/router.dart';
import 'package:rayik/widgets/custom_button.dart';

import '../../../core/constants/color_manager.dart';

import '../../../core/constants/strings.dart';
import '../../../core/theme/fonts_style.dart';
import '../../../widgets/back_button.dart';
import '../../login/form.dart';

class PageModel1 extends StatelessWidget {
  final PageController? controller;
  // key
  const PageModel1({
    this.controller,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    ThemeState themeState = context.read<ThemeCubit>().state;
    return Column(children: [
      SizedBox(height: 60.h),
      Container(
        height: 200.h,
        width: .95.sw,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
          boxShadow: [
            BoxShadow(
              color: ColorManager.greyTextColor.withOpacity(.2),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        margin: EdgeInsets.only(bottom: 10.h),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.buttonRadius),
                        ),
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(Dimensions.buttonRadius),
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Image.asset(
                              ImageManager.onboarding1,
                              height: 85.h,
                              width: 95.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      SizedBox(
                        height: 100.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 150.w,
                              child: Text(
                                context.locale.languageCode == 'en'
                                    ? 'Mohammed Mostafa'
                                    : 'محمد مصطفى',
                                style: AppTextStyle.h1.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              context.locale.languageCode == 'en'
                                  ? 'AI Engineer'
                                  : 'مهندس ذكاء اصطناعي',
                              style: AppTextStyle.h4Grey.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 100.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: CircleAvatar(
                            radius: 14.r,
                            backgroundColor:
                                ColorManager.greyTextColor.withOpacity(.1),
                            child: Center(
                              child: CustomBackButton(
                                isBack: false,
                                onPressed: () {
                                  // MagicRouter.navigateTo(
                                  //     const AppointmentDetailsForm());
                                },
                                size: 14.sp,
                                color:
                                    ColorManager.greyTextColor.withOpacity(.5),
                                isColored: true,
                                iosOnly: true,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 60.h,
                    width: .42.sw,
                    decoration: BoxDecoration(
                      color: themeState == ThemeState.light
                          ? ColorManager.blackTextColor
                          : ColorManager.whiteTextColor,
                      borderRadius:
                          BorderRadius.circular(Dimensions.buttonRadius),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Strings.bookACall.tr(),
                          style: AppTextStyle.h3.copyWith(
                            color: themeState == ThemeState.light
                                ? ColorManager.whiteTextColor
                                : ColorManager.blackTextColor,
                          ),
                        ),
                        Text(
                          "(\$ 90 / 30 min)",
                          style: AppTextStyle.h4Grey,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60.h,
                    width: .42.sw,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorManager.greyTextColor,
                        width: 1,
                      ),
                      borderRadius:
                          BorderRadius.circular(Dimensions.buttonRadius),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(Strings.message.tr(), style: AppTextStyle.h3),
                        Text(
                          "${Strings.startingAt.tr()}  10 \$",
                          style: AppTextStyle.h4Grey,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      SizedBox(
        height: 80.h,
      ),
      // OnBoarding Header1
      Text(
        Strings.savingTimeAndEffort.tr(),
        style: AppTextStyle.h1.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      SizedBox(
        height: 10.h,
      ),
      // OnBoarding Description1
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: SizedBox(
          height: 40.h,
          width: .9.sw,
          child: Center(
            child: Text(
              context.locale.languageCode == 'en'
                  ? "Get quick and efficient answers to your questions \n \t \t  easily through our professional consultants."
                  : "احصل على إجابات سريعة وفعالة لأسئلتك بسرعة\t\t \n \t  وسهولة من خلال استشاريينا المحترفين .",
              style: AppTextStyle.h4Grey.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 50.h,
      ),
      SizedBox(
        width: 1.sw,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              onTap: () {
                MagicRouter.navigateTo(const LoginView());
              },
              text: Strings.getStarted.tr(),
              color: ColorManager.primaryColor.withOpacity(.3),
              txtColor: ColorManager.primaryColor,
              width: .9.sw,
            ),
          ],
        ),
      ),
    ]);
  }
}
