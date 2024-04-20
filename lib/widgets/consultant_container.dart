import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rayik/core/bloc/dark_light_bloc/cubit.dart';
import 'package:rayik/core/constants/dimensions.dart';
import 'package:rayik/core/constants/icon_manager.dart';
import 'package:rayik/core/router/router.dart';
import 'package:rayik/core/theme/fonts_style.dart';
import '../../../core/constants/color_manager.dart';
import '../../../core/constants/hexa_color.dart';
import '../features/consultant_page/form.dart';

class ConsultantContainer extends StatelessWidget {
  final bool? isTopConsultant;
  final String? consultantName;
  final String? consultantImage;

  // final String? consultantSpecialization;
  // final String? consultantRating;
  // final String? consultantChatCount;



  const ConsultantContainer({
    this.isTopConsultant = false,
    this.consultantName,
    this.consultantImage,

    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeState themeState = context.watch<ThemeCubit>().state;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          MagicRouter.navigateTo(const ConsultantForm());
        },
        child: Container(
          height: 210.h,
          width: 241.w,
          decoration: BoxDecoration(
            color:
            themeState == ThemeState.dark
                ? ColorManager.darkContainerColor
                : ColorManager.whiteTextColor,
            borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
            boxShadow:
            themeState == ThemeState.dark
                ? []
                :
            [
              BoxShadow(
                color: ColorManager.greyTextColor.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                height: isTopConsultant ?? true ? 155.h : 130.h,
                width: 241.w,
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
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        consultantImage ??
                        "https://www.sbusinesslondon.ac.uk/blog/wp-content/uploads/2020/07/Consultant-scaled.jpg",
                    fit: BoxFit.fill,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
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
                          Expanded(
                            child: Text(

                              context.locale.toString() == 'ar'
                                  ? " محمد عبد الله"
                                  : "Mohamed Abdullah",
                              style: isTopConsultant ?? true
                                  ? AppTextStyle.h1
                                  : AppTextStyle.h3,
                            ),
                          ),
                          //SvgPicture.asset(IconManager.heartIcon, width: 20.w, height: 20.h, color: ColorManager.lightGreyColor,)
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              context.locale.toString() == 'ar'
                                  ? "متخصص في المحاماه"
                                  :
                              "Specialized in law",
                              style: AppTextStyle.hintTextField,
                            ),
                          ),
                          //  Text(Strings.consultantPrice.tr(), style: AppTextStyle.h4Grey,),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
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
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
