part of '../form.dart';

// Reviews List
class _Reviews extends StatelessWidget {
  const _Reviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeState themeState = context.read<ThemeCubit>().state;

    return Column(
      children: [
        Row(
          children: [
            Text(
              Strings.reviews.tr(),
              style: AppTextStyle.h1,
            ),
            SizedBox(width: 5.w),
            Text(
              "(10)",
              style: AppTextStyle.h4Grey,
            ),
          ],
        ),
        SizedBox(height: 20.h),
        ...List.generate(2, (index) => const ReviewItem()),
        SizedBox(height: 10.h),
        CustomButton(
          onTap: () {
            MagicRouter.navigateTo(const AllReviewForm());
          },
          text: Strings.showAllReviews.tr(),
          isColored: true,
          borderColor: themeState == ThemeState.dark
              ? ColorManager.whiteTextColor
              : Colors.black,
          color: Colors.transparent,
          txtColor: themeState == ThemeState.dark
              ? ColorManager.whiteTextColor
              : Colors.black,
        )
      ],
    );
  }
}

// Review Item
