part of '../form.dart';


class EmptyAppoints extends StatelessWidget {
  const EmptyAppoints({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      width: 1.sw,
      decoration: containerDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.h,
          ),
          SvgPicture.asset(
            IconManager.calender,
            colorFilter: const ColorFilter.mode(
                ColorManager.blackTextColor, BlendMode.srcIn),
            width: 40.w,
            height: 40.h,
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
              Strings.noPendingAppointmentsMessage.tr(),
              style: AppTextStyle.h4Grey,
            ),
          ),
          SizedBox(
            height: 60.h,
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
    );
  }
}
