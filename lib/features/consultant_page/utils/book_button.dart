part of '../form.dart';

class _BookButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {
        MagicRouter.navigateTo(const BookServiceTitle());
      },
      text: Strings.bookConsultation.tr(),
      textStyle: AppTextStyle.buttonBlackStyle,
      color: Colors.black,
      txtColor: Colors.white,
      radius: Dimensions.buttonRadius,
      width: 1.sw,
      height: 47.h,
      borderWidth: 0.0,
      borderColor: Colors.transparent,
      iconData: const BackIconInButton(),
      isGap: true,
    );
  }
}

class BackIconInButton extends StatelessWidget {
  const BackIconInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeState themeState = context.watch<ThemeCubit>().state;
    return CircleAvatar(
      backgroundColor: themeState == ThemeState.dark
          ? ColorManager.darkContainerColor.withOpacity(.4)
          : Colors.white.withOpacity(.2),
      radius: 15.r,
      child: Icon(
        context.locale == const Locale('en')
            ? Icons.arrow_forward_ios
            : Icons.arrow_forward_ios,
        color: Colors.white,
        size: 10.w,
      ),
    );
  }
}
