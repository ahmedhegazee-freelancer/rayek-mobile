part of'../form.dart';


class EmptyChats extends StatelessWidget {
  const EmptyChats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: .2.sw,
        ),
        Container(
          height: 250.h,
          width: 1.sw,
          decoration: containerDecoration(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Stack(
                children: [
                  SvgPicture.asset(
                    IconManager.noChats,
                    colorFilter: ColorFilter.mode(
                        ColorManager.greyTextColor.withOpacity(.2), BlendMode.srcIn),
                    width: 80.w,
                    height: 80.h,
                  ),
                  //
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                Strings.notFound.tr(),
                style: AppTextStyle.h1.copyWith(fontSize: 18.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: 0.6.sw,
                child: Text(
                  Strings.noPreviousCallsMessage.tr(),
                  style: AppTextStyle.h4Grey,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomButton(
                text: Strings.home.tr(),
                onTap: () {
                  MagicRouter.navigateAndPopAll(const MainProvider());
                },
                isGap: true,
                width: .85.sw,
                height: 45.h,
                iconData: const BackIconInButton(),
              )
            ],
          ),
        ),
      ],
    );
  }
}