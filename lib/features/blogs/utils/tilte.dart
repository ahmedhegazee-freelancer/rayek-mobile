part of '../form.dart';


class _BlogsTitle extends StatelessWidget {
  const _BlogsTitle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimensions.defaultPadding,
        right: Dimensions.defaultPadding,
        left: Dimensions.defaultPadding,
      ),
      child: Column(
        children: [
          SizedBox(height: 20.h),


          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [


              CircleAvatar(
                radius: 15.r,
                backgroundColor: ColorManager.primaryColor.withOpacity(.2),
                child: Center(
                  child:  CustomBackButton(
                    size: 15.sp,
                    color: ColorManager.primaryColor,
                    isColored: true,
                    iosOnly: true,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                Strings.blog.tr(),
                style: AppTextStyle.h1,
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                Strings.explorePopularArticles.tr(),
                style: AppTextStyle.h4Grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
