part of '../form.dart';

class ConsultantContainerV extends StatelessWidget {
  const ConsultantContainerV({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeState themeState = context.watch<ThemeCubit>().state;
    return InkWell(
      onTap: () {
        MagicRouter.navigateTo(const ConsultantForm());
      },
      child: Container(
        height: 175.h,
        width: 241.w,
        decoration: BoxDecoration(
          color: themeState == ThemeState.dark
              ? ColorManager.darkContainerColor
              : ColorManager.whiteTextColor,
          borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
          boxShadow: themeState == ThemeState.dark
              ? []
              : [
                  BoxShadow(
                    color: ColorManager.greyTextColor.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // height: isTopConsultant ?? true ? 155.h : 130.h,
                    width: 100.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.buttonRadius),
                        topRight: Radius.circular(Dimensions.buttonRadius),
                      ),
                      // image:  DecorationImage(
                      //   image: CachedNetworkImageProvider(
                      //       "https://th.bing.com/th/id/OIP.fFXk1pO4lPpkEKMLKKq2lwHaHa?w=1000&h=1000&rs=1&pid=ImgDetMain"
                      //   ),
                      //   fit: BoxFit.fill,
                      // ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.buttonRadius),
                        topRight: Radius.circular(Dimensions.buttonRadius),
                        bottomRight: Radius.circular(Dimensions.buttonRadius),
                        bottomLeft: Radius.circular(Dimensions.buttonRadius),
                      ),
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                "https://th.bing.com/th/id/R.af5d31745d1d968d0864d43c1d34284d?rik=oqwRj3PWcefAzg&riu=http%3a%2f%2fclassifieds.usatoday.com%2fwp-content%2fuploads%2f2018%2f07%2fsuccessful-consultant-768x512.jpeg&ehk=w0h2cIRtQck9OL2%2fJAEf%2b4rJNx2ad0gHYPgn7KWe0RQ%3d&risl=&pid=ImgRaw&r=0",
                            fit: BoxFit.fill,
                            height: 120.h,
                            width: 100.w,
                            placeholder: (context, url) => Shimmer.fromColors(
                                baseColor:
                                    ColorManager.primaryColor.withOpacity(0.5),
                                highlightColor: Colors.white12,
                                child: Container(
                                  color: ColorManager.primaryColor
                                      .withOpacity(0.5),
                                  height: 120.h,
                                  width: 90.w,
                                )),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                          Positioned(
                            top: 5,
                            child: Image.asset(
                              ImageManager.verify,
                              width: 25.w,
                              height: 25.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(Dimensions.defaultPadding),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 160.w,
                              child: Text(
                                  context.locale.toString() == 'ar'
                                      ? " محمد عبد الله"
                                      : "Mohamed Abdullah",
                                  style: AppTextStyle.h1),
                            ),
                            //SvgPicture.asset(IconManager.heartIcon, width: 20.w, height: 20.h, color: ColorManager.lightGreyColor,)
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                context.locale.toString() == 'ar'
                                    ? "متخصص في المحاماه"
                                    : "Specialized in law",
                              ),
                            ),
                            //  Text(Strings.consultantPrice.tr(), style: AppTextStyle.h4Grey,),
                          ],
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Expanded(
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "4.9",
                                    style: AppTextStyle.h4Black,
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: HexColor('#FFC107'),
                                    size: 20.sp,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '60',
                                    style: AppTextStyle.h4Grey,
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  SvgPicture.asset(
                                    IconManager.chat,
                                    width: 20.w,
                                    height: 20.h,
                                    colorFilter: const ColorFilter.mode(
                                        ColorManager.lightGreyColor,
                                        BlendMode.srcIn),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Description
                        SizedBox(
                          height: 5.h,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  context.locale.toString() == 'ar'
                                      ? "محامي متخصص في القانون الجنائي والقانون الدولي"
                                      : "A lawyer specialized in criminal law and international law",
                                  style: AppTextStyle.h4Grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Price
              ],
            ),
            Align(
              alignment: context.locale.toString() == 'ar'
                  ? Alignment.topLeft
                  : Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: SizedBox(
                  height: 100.h,
                  width: 50.w,
                  child: Column(
                    children: [
                      Text(
                        context.locale.toString() == 'ar'
                            ? "بداية من"
                            : "Starting from",
                        style: AppTextStyle.h4Grey,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "1000 \$",
                        style: AppTextStyle.h4Black.copyWith(
                          fontSize: 15.sp,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        context.locale.toString() == 'ar'
                            ? "للساعه"
                            : "Per Hour",
                        style: AppTextStyle.h4Grey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
