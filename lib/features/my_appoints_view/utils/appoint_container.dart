part of '../form.dart';

class AppointsContainer extends StatelessWidget {
  const AppointsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeState themeState = context.watch<ThemeCubit>().state;
    return Container(
      height: 200.h,
      width: 1.sw,
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
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBAvSxX7U3UvBVAggUW0Ec3jcFKbnB-V74vTSIuJzFu2gjqKeW70uMwo0TldPUKCOTuPQ&usqp=CAU',
                            height: 64.h,
                            width: 75.w,
                            fit: BoxFit.fill,
                            placeholder: (context, url) => Center(
                                child: Shimmer.fromColors(
                              baseColor: ColorManager.greyTextColor,
                              highlightColor: Colors.white,
                              child: Icon(
                                Icons.image,
                                size: 64.h,
                                color: ColorManager.greyTextColor,
                              ),
                            )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.locale.languageCode == 'en'
                              ? 'Dr. Ahmed Ali'
                              : 'د. أحمد علي',
                          style: AppTextStyle.h1.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          context.locale.languageCode == 'en'
                              ? 'Dermatologist'
                              : 'طبيب جلدية',
                          style: AppTextStyle.h4Grey.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        RatingBarIndicator(
                          itemBuilder: (context, index) {
                            return Icon(
                              Icons.star,
                              color: HexColor("#FFC107"),
                            );
                          },
                          itemSize: 16.sp,
                          rating: 4.5,
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                CircleAvatar(
                  radius: 14.r,
                  backgroundColor: ColorManager.greyTextColor.withOpacity(.2),
                  child: Center(
                    child: CustomBackButton(
                      isBack: false,
                      onPressed: () {
                        MagicRouter.navigateTo(const AppointmentDetailsForm());
                      },
                      size: 14.sp,
                      color: ColorManager.greyTextColor,
                      isColored: true,
                      iosOnly: true,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      IconManager.cash,
                      colorFilter: ColorFilter.mode(
                          themeState == ThemeState.light
                              ? ColorManager.blackTextColor
                              : ColorManager.whiteTextColor,
                          BlendMode.srcIn),
                      width: 20.w,
                      height: 20.h,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      '100\$',
                      style: AppTextStyle.h5,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      IconManager.audio,
                      colorFilter: ColorFilter.mode(
                          themeState == ThemeState.light
                              ? ColorManager.blackTextColor
                              : ColorManager.whiteTextColor,
                          BlendMode.srcIn),
                      width: 20.w,
                      height: 20.h,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      Strings.audioCall.tr(),
                      style: AppTextStyle.h5,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      IconManager.close,
                      colorFilter: ColorFilter.mode(
                          themeState == ThemeState.light
                              ? ColorManager.blackTextColor
                              : ColorManager.whiteTextColor,
                          BlendMode.srcIn),
                      width: 15.w,
                      height: 15.h,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      Strings.notPaid.tr(),
                      style: AppTextStyle.h5,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomButton(
              onTap: () {},
              text: "25/3/2024 - 03:30 PM",
              textStyle: AppTextStyle.h3.copyWith(
                color: themeState == ThemeState.light
                    ? ColorManager.whiteTextColor
                    : ColorManager.blackTextColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
              ),
              isGap: true,
              iconData: Icon(
                Icons.access_time_rounded,
                color: themeState == ThemeState.light
                    ? ColorManager.whiteTextColor
                    : ColorManager.blackTextColor,
                size: 20.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
