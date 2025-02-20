
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rayik/core/bloc/dark_light_bloc/cubit.dart';
import 'package:rayik/core/constants/dimensions.dart';
import 'package:rayik/core/theme/fonts_style.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/constants/color_manager.dart';
import '../../core/constants/strings.dart';
import '../../widgets/back_button.dart';


class SingleChatFrom extends StatelessWidget {
  const SingleChatFrom({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeState themeState = context.read<ThemeCubit>().state;
    return Scaffold(
      body:
      Padding(
        padding: EdgeInsets.only(left: Dimensions.defaultPadding, right: Dimensions.defaultPadding,
          top: Dimensions.defaultPadding),
        child: Stack(
          children: [
            Scaffold(
              body: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
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
                  Column(
                    children: [
                      // image with name
                      CircleAvatar(
                        radius: 35.r,
                        backgroundColor: ColorManager.primaryColor.withOpacity(.2),
                        child: Center(
                          child: CachedNetworkImage(
                            imageUrl: 'https://th.bing.com/th/id/OIP.kUE2yev9qd2Y5zbI0lg4AgAAAA?w=468&h=468&rs=1&pid=ImgDetMain',
                            imageBuilder: (context, imageProvider) => Container(
                              width: 70.0.w,
                              height: 70.0.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            placeholder: (context, url) => Shimmer(gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.grey.withOpacity(0.5),
                                  Colors.grey.withOpacity(0.3),
                                  Colors.grey.withOpacity(0.1),
                                  Colors.grey.withOpacity(0.3),
                                  Colors.grey.withOpacity(0.5),
                                ],
                                stops: const [0.1, 0.3, 0.5, 0.7, 0.9],
                              ), child: Container(
                              width: 60.0.w,
                              height: 60.0.h,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                            )

                            ),
                            errorWidget: (context, url, error) =>const  Icon(Icons.error),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        context.locale.languageCode == 'ar' ? 'د. محمد عبد الله' : 'Dr. Mohamed Abdullah',
                        style: AppTextStyle.h3.copyWith(fontWeight: FontWeight.bold),
                      ),

                    ],
                  ),
                ],
              ),
            ),
            // Text Field In Postioned bottom 10
            Positioned(
              bottom: 10.h,
              left: 0,
              right: 0,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: ColorManager.whiteTextColor,
                        borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
                        border: Border.all(color:
                            themeState ==
                        ThemeState.dark ? ColorManager.primaryColor : ColorManager.greyTextColor,
                          width: 2.w,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: Strings.typeYourMessageHere.tr(),
                                  hintStyle: AppTextStyle.h5.copyWith(color: ColorManager.greyTextColor),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: 10.w,bottom: 14.h),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.send
                            ,color: ColorManager.primaryColor,),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  CircleAvatar(
                    radius: 20.r,
                    backgroundColor: ColorManager.primaryColor,
                    child: const Center(
                      child: Icon(
                        Icons.mic,
                        color: ColorManager.whiteTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
