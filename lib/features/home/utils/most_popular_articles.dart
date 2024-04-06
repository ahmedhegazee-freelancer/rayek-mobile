part of '../form.dart';

class _MostPopular extends StatelessWidget {
  const _MostPopular({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        // Padding(
        //   padding: EdgeInsets.only(
        //     top: Dimensions.defaultPadding,
        //     right: Dimensions.defaultPadding,
        //     left: Dimensions.defaultPadding,
        //   ),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       Text(
        //         Strings.mostPopularArticles.tr(),
        //         style: AppTextStyle.h1,
        //       ),
        //     ],
        //   ),
        // ),
        // SizedBox(height: 10.h),
        // List view builder and builder is a cached network image with a title on bottom of image make it a stack
        SizedBox(
          height: 136.h,
          width: 1.sw,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return index == 0
                  ? SizedBox(
                width: 8.w,
              )
                  : InkWell(
                onTap: () {
                  MagicRouter.navigateTo(const BlogScreen());
                  // Navigate to article details
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                        'https://th.bing.com/th/id/R.c67155bfea060771b09cf143de4cf32b?rik=nc%2bWauxDF5EoGg&pid=ImgRaw&r=0',
                        imageBuilder: (context, imageProvider) =>
                            Container(
                              height: 136.h,
                              width: 150.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                        placeholder: (context, url) =>  Shimmer(gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            ColorManager.primaryColor,
                            Colors.white,
                          ],
                        ),child:
                        Container(
                          height: 136.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
                          ),
                        ),),
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                      ),
                      Positioned(
                        bottom: 25.h,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                context.locale.languageCode == 'en'
                                    ? 'Lawyers'
                                    : 'المحاماة',
                                style: AppTextStyle.h3.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
