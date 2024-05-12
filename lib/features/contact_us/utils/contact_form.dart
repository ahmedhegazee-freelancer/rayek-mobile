part of '../form.dart';

class _ContactForm extends StatelessWidget {
  const _ContactForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeState themeState = context.watch<ThemeCubit>().state;
    return Column(
      children: [
        Container(
          decoration: _containerDecoration(context).copyWith(
            color: themeState == ThemeState.dark
                ? ColorManager.darkContainerColor
                : ColorManager.whiteTextColor,
            border: Border.all(
              color: themeState == ThemeState.dark
                  ? ColorManager.whiteTextColor
                  : Colors.transparent,
              width: 2,
            ),
          ),
          child: Center(
            child: CustomTextField(
              heightOfTextField: 46.h,
              hintText: Strings.email.tr(),
              hasPrefix: false,
              borderColor: Colors.transparent,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          decoration: _containerDecoration(context).copyWith(
            color: themeState == ThemeState.dark
                ? ColorManager.darkContainerColor
                : ColorManager.whiteTextColor,
            border: Border.all(
              color: themeState == ThemeState.dark
                  ? ColorManager.whiteTextColor
                  : Colors.transparent,
              width: 2,
            ),
          ),
          child: Center(
            child: CustomTextField(
              heightOfTextField: 46.h,
              hintText: Strings.subject.tr(),
              hasPrefix: false,
              borderColor: Colors.transparent,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          decoration: _containerDecoration(context).copyWith(
            color: themeState == ThemeState.dark
                ? ColorManager.darkContainerColor
                : ColorManager.whiteTextColor,
            border: Border.all(
              color: themeState == ThemeState.dark
                  ? ColorManager.whiteTextColor
                  : Colors.transparent,
              width: 2,
            ),
          ),
          child: Center(
            child: CustomTextField(
              heightOfTextField: 80.h,
              hintText: Strings.message.tr(),
              hasPrefix: false,
              borderColor: Colors.transparent,
              maxLines: 5,
            ),
          ),
        ),
      ],
    );
  }
}

BoxDecoration _containerDecoration(BuildContext context) {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 2,
        blurRadius: 1,
        offset: const Offset(0, 1),
      ),
    ],
  );
}
