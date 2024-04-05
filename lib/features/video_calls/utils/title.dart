part of'../form.dart';

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(left: Dimensions.defaultPadding, right: Dimensions.defaultPadding, top: 50.h),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
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
            ToggleList()
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


          ],),
      ),
    );
  }
}
