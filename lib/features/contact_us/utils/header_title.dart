part of '../form.dart';

class _ContactTitle extends StatelessWidget {
  const _ContactTitle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
              Strings.contactUs.tr(),
              style: AppTextStyle.h1,
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              Strings.stepContact.tr(),
              style: AppTextStyle.h4Grey,
            ),
          ],
        ),
        SizedBox(height: 20.h),
      ],);
  }
}
