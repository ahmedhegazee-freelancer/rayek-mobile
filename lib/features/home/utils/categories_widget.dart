import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rayik/core/bloc/dark_light_bloc/cubit.dart';
import 'package:rayik/core/constants/color_manager.dart';
import 'package:rayik/core/constants/dimensions.dart';
import 'package:rayik/core/theme/fonts_style.dart';
import 'package:rayik/features/consultants_view/form.dart';
import '../../../core/constants/strings.dart';
import '../../../core/router/router.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // List of categories
    List<String> categoriesNames = [
      Strings.law.tr(),
      Strings.sports.tr(),
      Strings.education.tr(),
      Strings.law.tr(),
      Strings.sports.tr(),
      Strings.education.tr(),
    ];
    // List<String> categoriesIcon = [
    //   IconManager.lawyer,
    //   IconManager.sports,
    //   IconManager.education,
    //   IconManager.lawyer,
    //   IconManager.sports,
    //   IconManager.education,
    //
    // ] ;
    ThemeState themeState = context.watch<ThemeCubit>().state;
    return Padding(
      padding: EdgeInsets.all(Dimensions.defaultPadding),
      child: SizedBox(
        height: .18.sh,
        width: 1.sw,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.75,
              crossAxisSpacing: 3.w,
              mainAxisSpacing: 10.h),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 6,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                MagicRouter.navigateTo(const ConsultantsView());
              },
              child: Container(
                height: 44.h,
                width: 97.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
                  color: themeState == ThemeState.dark
                      ? ColorManager.darkContainerColor
                      : ColorManager.whiteTextColor,
                  boxShadow: themeState == ThemeState.dark
                      ? []
                      : [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SvgPicture.asset(
                      //   categoriesIcon[index],
                      //   height: 30.h,
                      // ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            categoriesNames[index],
                            style: AppTextStyle.h4Black,
                          ),
                          // num of items
                          Text("(10) ${Strings.consultant.tr()}",
                              style: AppTextStyle.h6)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
