
part of'../form.dart';

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            SvgPicture.asset(
                IconManager.notification,
                height: 25.h,
                width: 25.w,
                colorFilter: const ColorFilter.mode(
                  ColorManager.primaryColor,
                  BlendMode.srcIn,
                )
            ),

            CircleAvatar(
              radius: 15.r,
              backgroundColor: ColorManager.primaryColor.withOpacity(.2),
              child: Center(
                child:  CustomBackButton(
                  size: 15.sp,
                  color: ColorManager.primaryColor,
                  isColored: true,
                  iosOnly: true,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              Strings.reviews.tr(),
              style: AppTextStyle.h1,
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Strings.allReviewsAreTrusted.tr(),
              style: AppTextStyle.h4Grey,
            ),
          ],
        ),
        SizedBox(height: 20.h),
      ],);
  }
}
