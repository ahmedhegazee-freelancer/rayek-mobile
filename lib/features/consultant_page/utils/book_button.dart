part of '../form.dart';

class _BookButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {
        MagicRouter.navigateTo(const EditProfileForm());
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
  const BackIconInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white.withOpacity(.2),
      radius: 15.r,
      child: Icon(
        context.locale == const Locale('en')
            ? Icons.arrow_back_ios
            : Icons.arrow_forward_ios,
        color: Colors.white,
        size: 10.w,
      ),
    );
  }
}
