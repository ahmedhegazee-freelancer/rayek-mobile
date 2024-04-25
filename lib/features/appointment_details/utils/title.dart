part of '../form.dart';


class _MyAppointsTitle extends StatelessWidget {
  const _MyAppointsTitle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.defaultPadding),
      child: Column(
        children: [

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     CircleAvatar(
          //       radius: 15.r,
          //       backgroundColor: ColorManager.primaryColor.withOpacity(.2),
          //       child: Center(
          //         child:  CustomBackButton(
          //           size: 15.sp,
          //           color: ColorManager.primaryColor,
          //           isColored: true,
          //           iosOnly: true,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                Strings.appointments.tr(),
                style: AppTextStyle.h1,
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                Strings.manageAndViewById.tr(),
                style: AppTextStyle.h4Grey,
              ),
            ],
          ),
          SizedBox(height: 20.h),
        ],),
    );
  }
}
