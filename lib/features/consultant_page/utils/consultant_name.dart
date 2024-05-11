
part of'../form.dart';
class _ConsultantName extends StatelessWidget {
  final String? name;
  final String? specialty;

  const _ConsultantName({
    this.name,
    this.specialty,
  });

  @override
  Widget build(BuildContext context) {
    ThemeState themeState = context.watch<ThemeCubit>().state;
    return Column(
      children: [
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name ?? '',
              style: AppTextStyle.h1.copyWith(
                fontSize: 19.sp,
              ),
            ),
            SizedBox(width: 0.w),
            Image.asset(
              ImageManager.verify,
              height: 20.h,
              width: 20.w,
            ),
            const Spacer(),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    launchUrl(Uri.parse('https://www.google.com'));

                  },
                  child: SvgPicture.asset(
                    IconManager.website,
                    height: 18.h,
                    width: 18.w,
                      colorFilter: ColorFilter.mode(
                        themeState == ThemeState.dark
                            ? ColorManager.whiteTextColor
                            : Colors.grey,
                        BlendMode.srcIn,
                      )
                  ),
                ),
                SizedBox(width: 10.w),
                GestureDetector(
                  onTap: () {
                    launchUrl(Uri.parse('https://www.linkedin.com'));
                  },
                  child: SvgPicture.asset(
                    IconManager.linkedin,
                    height: 17.h,
                    width: 17.w,
                  ),
                ),
                SizedBox(width: 10.w),
                GestureDetector(
                  onTap: () {
                    launchUrl(Uri.parse('https://www.twitter.com'));
                  },
                  child: SvgPicture.asset(
                    IconManager.x,
                    height: 18.h,
                    width: 18.w,
                    colorFilter: ColorFilter.mode(
                      themeState == ThemeState.dark
                          ? ColorManager.whiteTextColor
                          : Colors.black,
                      BlendMode.srcIn,
                    )
                  ),
                ),
                SizedBox(width: 10.w),
                GestureDetector(
                  onTap: () {
                    launchUrl(Uri.parse('https://www.instagram.com'));
                  },
                  child: SvgPicture.asset(
                    IconManager.insta,
                    height: 17.h,
                    width: 17.w,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              specialty ?? '',
              style: AppTextStyle.h4Grey,
            ),
          ],
        ),
      ],
    );
  }
}
