
 part of '../form.dart';


class _Question extends StatelessWidget {
  final String? question;
  const _Question({
    this.question,
  });

  @override
  Widget build(BuildContext context) {
    ThemeState themeState = context.watch<ThemeCubit>().state;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 15.w,),
        CircleAvatar(
          radius: 3.r,
          backgroundColor:
              themeState == ThemeState.light
                  ? ColorManager.blackTextColor
                  : ColorManager.whiteTextColor,
        ),
        SizedBox(width: 10.w),
        Text(
          question == null
              ? context.locale.toString() == 'ar'
              ? 'كيف يمكن التعامل مع الضغط؟'
              : 'How to deal with stress?'
              : question!,
          style: AppTextStyle.h4Grey.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
