part of '../form.dart';


class _Services extends StatelessWidget {
  const _Services({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeState themeState = context.watch<ThemeCubit>().state;
    return Column(
      children: [
        SizedBox(height: 20.h),
        Container(
            decoration: BoxDecoration(
              color: themeState == ThemeState.dark
                  ? ColorManager.newDarkGrey
                  : Colors.white.withOpacity(.9),
              boxShadow:
              themeState == ThemeState.dark? []:
              [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1),
                )
              ],
              borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
            ),
            child: Padding(
              padding:  EdgeInsets.all(Dimensions.defaultPadding),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        Strings.textAudioAnswer.tr(),
                        style: AppTextStyle.h3

                      )
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          Strings.getTextOrAudioResponseToATextQuestion.tr(),
                          style: AppTextStyle.h3.copyWith(
                            color: ColorManager.greyTextColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      SvgPicture.asset(
                        IconManager.chatIcon,
                        width: 22.w,
                        height: 22.h,
                      ),
                      SizedBox(width: 20.w),
                      Text(
                          "5",
                          style: AppTextStyle.h3
                      ),
                      SizedBox(width: 5.w),
                      // currecy
                      Text(
                          context.locale.toString() == 'ar'
                              ? 'دينار كويتي'
                              : 'KWD',
                          style: AppTextStyle.h3
                      ),

                    ],
                  ),
                  SizedBox(height: 20.h),
                  Divider(
                    color: themeState == ThemeState.light
                        ? ColorManager.blackTextColor
                        : ColorManager.dividerColor,
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Text(
                        Strings.videoAnswer.tr(),
                        style: AppTextStyle.h3

                      )
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          Strings.getAVideoResponseToATextQuestion.tr(),
                          style: AppTextStyle.h3.copyWith(
                            color: ColorManager.greyTextColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      SvgPicture.asset(
                        IconManager.videoIcon,
                        width: 25.w,
                        height: 25.h,
                      ),
                      SizedBox(width: 20.w),
                      Text(
                          "20",
                          style: AppTextStyle.h3
                      ),
                      SizedBox(width: 5.w),
                      // currecy
                      Text(
                          context.locale.toString() == 'ar'
                              ? 'دينار كويتي'
                              : 'KWD',
                          style: AppTextStyle.h3
                      ),

                    ],
                  ),
                ],
              ),
            )
        ),

        SizedBox(height: 20.h),
        Divider(
          color: themeState == ThemeState.light
              ? ColorManager.blackTextColor
              : ColorManager.dividerColor,
        ),
        SizedBox(height: 20.h),
        Container(
            decoration: BoxDecoration(
              color: themeState == ThemeState.dark
                  ? ColorManager.newDarkGrey
                  : Colors.white.withOpacity(.9),
              borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
              boxShadow: themeState == ThemeState.dark? []:
              [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1),
                )
              ],
            ),
            child: Padding(
              padding:  EdgeInsets.all(Dimensions.defaultPadding),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        Strings.videoCall.tr(),
                        style: AppTextStyle.h3

                      )
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          Strings.bookATimeForUsToHaveAOneOnOneCallForTheMostPersonalizedAdvice.tr(),
                          style: AppTextStyle.h3.copyWith(
                            color: ColorManager.greyTextColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      SvgPicture.asset(
                        IconManager.videoCall,
                        width: 25.w,
                        height: 25.h,
                      ),
                      SizedBox(width: 20.w),
                      Text(
                          "100",
                          style: AppTextStyle.h3
                      ),
                      SizedBox(width: 5.w),
                      // currecy
                      Text(
                          context.locale.toString() == 'ar'
                              ? 'دينار كويتي'
                              : 'KWD',
                          style: AppTextStyle.h3
                      ),

                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Expanded(child:
                      Text(
                        Strings.minutesMinimumExtendTimeAvailableInCall.tr(),
                        style: AppTextStyle.h3.copyWith(
                          color: ColorManager.greyTextColor,
                          fontWeight: FontWeight.w400,
                        ),


                      ))
                    ],
                  )
                ],
              ),
            )
        ),
      ],
    );
  }
}
