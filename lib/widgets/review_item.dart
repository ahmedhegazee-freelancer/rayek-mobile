import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/bloc/dark_light_bloc/cubit.dart';
import '../core/constants/dimensions.dart';
import '../core/constants/hexa_color.dart';
import '../core/theme/fonts_style.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeState themeState = context.watch<ThemeCubit>().state;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: themeState == ThemeState.dark
                ? HexColor("#383838")
                : Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 1),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20.r,
                      backgroundImage: const NetworkImage(
                          'https://th.bing.com/th/id/OIP.fFXk1pO4lPpkEKMLKKq2lwHaHa?w=1000&h=1000&rs=1&pid=ImgDetMain'),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.locale.toString() == 'en'
                              ? 'Ahmed Ali'
                              : 'احمد علي',
                          style: AppTextStyle.h3,
                        ),
                        Text(
                          context.locale.toString() == 'en'
                              ? 'Since 3 days'
                              : 'منذ 3 ايام',
                          style: AppTextStyle.h4Grey,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RatingBar.builder(
                      itemSize: 20.r,
                      initialRating: 4,
                      minRating: 1,
                      direction: Axis.horizontal,
                      ignoreGestures: true,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.zero,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: HexColor("#FFC107"),
                      ),
                      // not settable

                      onRatingUpdate: (rating) {},
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Text(
                  context.locale.toString() == 'en'
                      ? 'This text is an example of text that can be replaced in the same space, this text was generated from the Arabic text generator'
                      : 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى',
                  style: AppTextStyle.h4Grey,
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
