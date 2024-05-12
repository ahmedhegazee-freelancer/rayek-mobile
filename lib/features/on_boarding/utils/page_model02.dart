import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/color_manager.dart';
import '../../../core/constants/dimensions.dart';
import '../../../core/constants/image_manager.dart';
import '../../../core/constants/strings.dart';
import '../../../core/router/router.dart';
import '../../../core/theme/fonts_style.dart';
import '../../../widgets/custom_button.dart';
import '../../login/form.dart';

class PageModel2 extends StatelessWidget {
  final PageController? controller;
  // key
  const PageModel2({
    this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(height: 40.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
                  child: Image.asset(
                    ImageManager.onboarding1,
                    height: 152.h,
                    width: 134.w,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
                  child: Image.asset(
                    ImageManager.onboarding2,
                    height: 111.h,
                    width: 133.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
                  child: Image.asset(
                    ImageManager.onboarding3,
                    height: 113.h,
                    width: 134.w,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
                  child: Image.asset(
                    ImageManager.onboarding4,
                    height: 153.h,
                    width: 134.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
      
          ],
        ),
        SizedBox(
          height: 50.h,
        ),
        // OnBoarding Header1
        Text(
          Strings.biggestCommunity.tr(),
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
                    ? "Experience a unique consulting experience with a diverse group of qualified and professional consultants in all fields."
                    : "اكتشف تجربة استشارية فريدة مع مجموعة متنوعة من \n الاستشاريين المؤهلين والمحترفين في جميع المجالات .",
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
