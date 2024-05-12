part of '../form.dart';

class _Categories extends StatelessWidget {
  const _Categories({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: EdgeInsets.only(
            right: Dimensions.defaultPadding,
            left: Dimensions.defaultPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                Strings.forYou.tr(),
                style: AppTextStyle.h1,
              ),
            ],
          ),
        ),
        DefaultTabController(
          length: 3,
          child: Column(
            children: [
              TabBar(
                indicatorColor: ColorManager.primaryColor,
                labelColor: ColorManager.primaryColor,
                unselectedLabelColor: ColorManager.greyTextColor,
                tabs: [
                  Tab(
                    text: Strings.law.tr(),
                  ),
                  Tab(
                    text: Strings.service.tr(),
                  ),
                  Tab(
                    text: Strings.sports.tr(),
                  ),
                ],
              ),
              SizedBox(
                height: .385.sh,
                child: TabBarView(
                  children: [
                    ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return _buildArticleCard(context);
                      },
                    ),
                    Center(
                      child: Text(
                        Strings.noArticles.tr(),
                        style: AppTextStyle.h3
                            .copyWith(color: ColorManager.greyTextColor),
                      ),
                    ),
                    ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return _buildArticleCard(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildArticleCard(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 2.h,
      ),
      child: InkWell(
        onTap: () {
          MagicRouter.navigateTo(const BlogScreen());
        },
        child: Container(
          height: .15.sh,
          decoration: BoxDecoration(
            color: ColorManager.whiteTextColor,
            borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
            boxShadow: [
              BoxShadow(
                color: ColorManager.greyTextColor.withOpacity(.2),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: Dimensions.defaultPadding,
              right: Dimensions.defaultPadding,
              left: Dimensions.defaultPadding,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://th.bing.com/th/id/R.38f6a22dc4b62741bb042f22ef214cb6?rik=2mPJPteLFI4s6w&pid=ImgRaw&r=0',
                    height: 90.h,
                    width: 90.w,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => Shimmer(
                      gradient: LinearGradient(
                        colors: [
                          Colors.grey,
                          Colors.grey.shade200,
                        ],
                      ),
                      child:  Container(
                        height: 90.h,
                        width: 90.w,
                        color: Colors.grey,
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            IconManager.timer,
                            height: 14.h,
                            width: 14.w,
                            colorFilter: const ColorFilter.mode(
                              ColorManager.greyTextColor,
                              BlendMode.srcIn,
                            )
                          ),
                          SizedBox(
                            width: 5.w,
                          ),

                          Text(
                            "20 - 10- 2021",
                            style: AppTextStyle.h4Grey,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Expanded(
                        child: Text(
                          context.locale.languageCode == 'ar'
                              ? 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة'
                              : 'This is an example of a text that can be replaced in the same space',
                          style: AppTextStyle.h3.copyWith(
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
