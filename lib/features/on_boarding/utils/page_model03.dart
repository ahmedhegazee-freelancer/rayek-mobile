import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rayik/core/constants/icon_manager.dart';
import '../../../core/constants/color_manager.dart';
import '../../../core/constants/dimensions.dart';
import '../../../core/constants/strings.dart';
import '../../../core/router/router.dart';
import '../../../core/theme/fonts_style.dart';
import '../../../widgets/custom_button.dart';
import '../../login/form.dart';

class PageModel3 extends StatelessWidget {
  final PageController? controller;
  // key
  const PageModel3({
    this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(height: 60.h),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 95.h,
              width: .9.sw,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
                color: ColorManager.greyButtonColor,

              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [

                    Column(
                      children: [
                        Text(
                          context.locale.languageCode == 'en'
                              ? "Mohammed Khalifa"
                              : "محمد خليفة",
                          style: AppTextStyle.h1.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            context.locale.languageCode == 'en'
                                ? "Software Developer"
                                : "مطور برمجيات",
                            style: AppTextStyle.h4Grey.copyWith(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      context.locale.languageCode == 'en'
                          ? IconManager.dateOnbEn1
                          :
                      IconManager.dateOnbAr1,
                      height: 80.h,
                      width: 80.w,
                    ),

                  ],
                ),
              )
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
                height: 95.h,
                width: .9.sw,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
                  color: ColorManager.greyButtonColor,

                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [

                      Column(
                        children: [
                          Text(
                            context.locale.languageCode == 'en'
                                ? "Amr Eleraky"
                                : "عمرو العراقي",
                            style: AppTextStyle.h1.copyWith(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              context.locale.languageCode == 'en'
                                  ? "Financial Analyst"
                                  : "محلل مالي",
                              style: AppTextStyle.h4Grey.copyWith(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        context.locale.languageCode == 'en'
                            ? IconManager.dateOnbEn2
                            :
                        IconManager.dateOnbAr2,
                        height: 80.h,
                        width: 80.w,
                      ),

                    ],
                  ),
                )
            ),

          ],
        ),
        SizedBox(
          height: 80.h,
        ),
        // OnBoarding Header1
        Text(
          Strings.easyToUse.tr(),
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
            width: .95.sw,
            child: Center(
              child: Text(
                context.locale.languageCode == 'en'
                    ? "Enjoy an easy-to-use application that provides you with a comfortable interactive experience to access the support and advice you need."
                    : "استمتع بتطبيق سهل الاستخدام يوفر لك تجربة تفاعلية\n \t مريحة للحصول على الدعم والمشورة التي تحتاجها . ",
                style: AppTextStyle.h4Grey.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Column(
          children: [
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
                    color: ColorManager.primaryColor.withOpacity(.2),
                    txtColor: ColorManager.primaryColor,
                    width: .9.sw,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: 1.sw,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    onTap: () {
                      // go to index 2
                      controller!.animateToPage(2,
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.easeInOut);
                    },
                    text: Strings.exploreApp.tr(),
                    color: ColorManager.greyButtonColor,
                    // borderColor: themeState == ThemeState.light
                    //     ? ColorManager.blackTextColor
                    //     : ColorManager.whiteTextColor,
                    txtColor: ColorManager.greyTextColor,
                    width: .9.sw,
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
