part of'../form.dart';

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 150.h,
      child: Padding(
        padding:  EdgeInsets.only(left: Dimensions.defaultPadding, right: Dimensions.defaultPadding),
        child: Column(
          children: [

            SizedBox(
              height: 80.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  Strings.chats.tr(),
                  style: AppTextStyle.h1,
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.manageAndViewByIdChats.tr(),
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



          ],),
      ),
    );
  }
}
