part of'../form.dart';

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(
        //   height: 18.h,),

        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //
        //     CircleAvatar(
        //       radius: 15.r,
        //       backgroundColor: ColorManager.primaryColor.withOpacity(.2),
        //       child: Center(
        //         child:
        //         Icon(
        //           Icons.menu,
        //           color: ColorManager.primaryColor,
        //           size: 15.sp,
        //         ),
        //       ),
        //       //   CustomBackButton(
        //       //     size: 15.sp,
        //       //     color: ColorManager.primaryColor,
        //       //     isColored: true,
        //       //     iosOnly: true,
        //       //   ),
        //       // ),
        //     ),
        //
        //     SvgPicture.asset(
        //         IconManager.notification,
        //         height: 25.h,
        //         width: 25.w,
        //         colorFilter: const ColorFilter.mode(
        //           ColorManager.primaryColor,
        //           BlendMode.srcIn,
        //         )
        //     ),
        //
        //
        //   ],
        // ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              Strings.calls.tr(),
              style: AppTextStyle.h1,
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Strings.manageAndViewByIdCalls.tr(),
              style: AppTextStyle.h4Grey,
            ),
            SizedBox(width: 10.w),

          ],
        ),
        SizedBox(height: 20.h),
        // CustomTextField(
        //   hintText: Strings.searchHere.tr(),
        //   obscure: false,
        //   hasPrefix: false,
        //   svgIconSuffix: IconManager.searchIcon,
        //   readonly: true,
        //   onTap: () {
        //     MagicRouter.navigateTo(const SearchForm());
        //   },
        // ),
        // SizedBox(height: 20.h),


      ],);
  }
}
