part of '../form.dart';

class _BookButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeState themeState = context.watch<ThemeCubit>().state;
    return Container(
      color: themeState == ThemeState.light
          ? ColorManager.whiteTextColor
          : ColorManager.blackTextColor,
      child: Padding(
          padding: EdgeInsets.all(
            Dimensions.defaultPadding,
          ),
          child:               Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  MagicRouter.navigateTo(
                    const BookServiceForm(),
                  );
                },
                child: Container(
                  height: 60.h,
                  width: .42.sw,
                  decoration: BoxDecoration(
                    color: themeState == ThemeState.light
                        ? ColorManager.blackTextColor
                        : ColorManager.whiteTextColor,
                    borderRadius:
                    BorderRadius.circular(Dimensions.buttonRadius),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Strings.bookACall.tr(),
                        style: AppTextStyle.h3.copyWith(
                          color: themeState == ThemeState.light
                              ? ColorManager.whiteTextColor
                              : ColorManager.blackTextColor,
                        ),
                      ),
                      Text(
                        "(\$ 90 / 30 min)",
                        style: AppTextStyle.h4Grey,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 60.h,
                width: .42.sw,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorManager.greyTextColor,
                    width: 1,
                  ),
                  borderRadius:
                  BorderRadius.circular(Dimensions.buttonRadius),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(Strings.message.tr(), style: AppTextStyle.h3),
                    Text(
                      "${Strings.startingAt.tr()}  10 \$",
                      style: AppTextStyle.h4Grey,
                    ),
                  ],
                ),
              ),
            ],
          )

      ),
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
