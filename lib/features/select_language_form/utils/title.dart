part of '../form.dart';

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);
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
              Strings.selectLanguage.tr(),
              style: AppTextStyle.h1,
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              Strings.selectLanguageSubtitle.tr(),
              style: AppTextStyle.h4Grey,
            ),
          ],
        ),
        SizedBox(height: 20.h),
      ],);
  }
}
