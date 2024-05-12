// Blog Screen
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rayik/widgets/sliver_page.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/constants/color_manager.dart';
import '../../core/constants/dimensions.dart';
import '../../core/constants/icon_manager.dart';
import '../../core/theme/fonts_style.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomSliverPage(
        image: CachedNetworkImage(
          imageUrl:
              'https://th.bing.com/th/id/R.c67155bfea060771b09cf143de4cf32b?rik=nc%2bWauxDF5EoGg&pid=ImgRaw&r=0',
          imageBuilder: (context, imageProvider) => Container(
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
          placeholder: (context, url) => Shimmer(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ColorManager.primaryColor,
                Colors.white,
              ],
            ),
            child: Container(
              height: 136.h,
              width: 150.w,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
              ),
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        body: Padding(
          padding: EdgeInsets.all(Dimensions.defaultPadding),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // have the category name in the center of the image
                Container(
                  height: 30.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.buttonRadius),
                    color: Colors.orange.withOpacity(.2),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Center(
                      child: Text(
                        context.locale.languageCode == 'en'
                            ? 'Lawyers'
                            : 'المحاماة',
                        style: AppTextStyle.h3.copyWith(
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                // Row with created date and icon data
                Row(
                  children: [
                    SvgPicture.asset(
                      IconManager.timer,
                      colorFilter: const ColorFilter.mode(
                        ColorManager.blackTextColor,
                        BlendMode.srcIn,
                      ),
                      width: 15.w,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      '10/10/2021',
                      style: AppTextStyle.subtitleStyle.copyWith(
                        color: ColorManager.blackTextColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30.h),
            // Text with Title
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    context.locale.languageCode == 'ar'
                        ? 'هذا النص هو مثال لعنوان المقال '
                        : 'This is an example of a tile for the article',
                    style: AppTextStyle.h3.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            const Divider(
              color: ColorManager.greyTextColor,
              thickness: 1,
            ),
            SizedBox(height: 20.h),

            // Subtitle
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    context.locale.languageCode == 'ar'
                        ? 'عنوان فرعي للمقال'
                        : 'Subtitle for the article',
                    style: AppTextStyle.subtitleStyle
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.h),
            // Text with content
            SelectableText(

              context.locale.languageCode == 'ar'
                  ? """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis iaculis nisl massa, in placerat elit scelerisque at. Maecenas mi metus, vulputate eget nunc id, blandit tincidunt ligula. Phasellus egestas libero est, nec lacinia nulla ultricies non. Integer eu ultricies ante. Nulla vitae mi et arcu fringilla commodo quis ac felis. Sed sagittis varius mi sed auctor. Suspendisse posuere fermentum sodales.

In hac habitasse platea dictumst. Aenean vel dolor semper, elementum elit sodales, lobortis nulla. Pellentesque et purus ut nulla aliquam scelerisque mattis vel ex. Ut ultrices turpis ac sem ornare fermentum. Suspendisse imperdiet tempor laoreet. Suspendisse imperdiet, mi ac ultricies iaculis, risus lacus tincidunt libero, at laoreet nulla enim id arcu. Nulla ultricies bibendum nunc, sed sagittis neque interdum quis. Maecenas semper, orci at pharetra venenatis, risus lacus feugiat arcu, non molestie lorem magna nec neque. In hac habitasse platea dictumst. Fusce ornare tortor id justo hendrerit, quis elementum nisi finibus. Curabitur et sollicitudin nisl. Ut sodales, sapien id venenatis suscipit, mi mauris vehicula nunc, non congue nibh lacus a lorem. Nam lacinia arcu vel leo tempor auctor. Nulla mattis commodo efficitur. Mauris sit amet tellus nisl. Phasellus ut eleifend nisi.

Maecenas suscipit ex mi, id pellentesque nisl porttitor et. Mauris arcu dolor, maximus id pellentesque elementum, interdum et diam. Morbi molestie ultricies nulla, eget ullamcorper tellus semper at. Aliquam erat volutpat. Maecenas at egestas diam. Nulla eleifend mi eget magna rutrum posuere. Etiam consequat metus venenatis, interdum metus a, pretium ante. In id enim id dolor porta imperdiet. In eleifend eget lectus auctor consectetur. Etiam maximus massa odio, vel bibendum erat imperdiet et.

Nulla sapien est, tempor sit amet felis egestas, posuere finibus sapien. Ut quis laoreet quam. Curabitur sollicitudin eget ante ac pretium. Vivamus sodales hendrerit tortor et cursus. Aenean non est mattis magna accumsan iaculis sed eget mi. Pellentesque dictum volutpat tempor. Morbi eleifend orci a quam rutrum tincidunt.

Mauris venenatis massa non lobortis consequat. Sed eleifend aliquet erat id pretium. Donec efficitur purus non suscipit maximus. Pellentesque suscipit vestibulum enim at iaculis. Phasellus ornare blandit rutrum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed nec pharetra tortor, nec dignissim neque. Integer leo velit, convallis ornare vestibulum eu, rutrum sed urna. Nulla euismod ultrices gravida. Morbi interdum nisl tortor, sodales viverra dolor auctor vel.

"""
                  :"""Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis iaculis nisl massa, in placerat elit scelerisque at. Maecenas mi metus, vulputate eget nunc id, blandit tincidunt ligula. Phasellus egestas libero est, nec lacinia nulla ultricies non. Integer eu ultricies ante. Nulla vitae mi et arcu fringilla commodo quis ac felis. Sed sagittis varius mi sed auctor. Suspendisse posuere fermentum sodales.
            
            In hac habitasse platea dictumst. Aenean vel dolor semper, elementum elit sodales, lobortis nulla. Pellentesque et purus ut nulla aliquam scelerisque mattis vel ex. Ut ultrices turpis ac sem ornare fermentum. Suspendisse imperdiet tempor laoreet. Suspendisse imperdiet, mi ac ultricies iaculis, risus lacus tincidunt libero, at laoreet nulla enim id arcu. Nulla ultricies bibendum nunc, sed sagittis neque interdum quis. Maecenas semper, orci at pharetra venenatis, risus lacus feugiat arcu, non molestie lorem magna nec neque. In hac habitasse platea dictumst. Fusce ornare tortor id justo hendrerit, quis elementum nisi finibus. Curabitur et sollicitudin nisl. Ut sodales, sapien id venenatis suscipit, mi mauris vehicula nunc, non congue nibh lacus a lorem. Nam lacinia arcu vel leo tempor auctor. Nulla mattis commodo efficitur. Mauris sit amet tellus nisl. Phasellus ut eleifend nisi.
            
            Maecenas suscipit ex mi, id pellentesque nisl porttitor et. Mauris arcu dolor, maximus id pellentesque elementum, interdum et diam. Morbi molestie ultricies nulla, eget ullamcorper tellus semper at. Aliquam erat volutpat. Maecenas at egestas diam. Nulla eleifend mi eget magna rutrum posuere. Etiam consequat metus venenatis, interdum metus a, pretium ante. In id enim id dolor porta imperdiet. In eleifend eget lectus auctor consectetur. Etiam maximus massa odio, vel bibendum erat imperdiet et.
            
            Nulla sapien est, tempor sit amet felis egestas, posuere finibus sapien. Ut quis laoreet quam. Curabitur sollicitudin eget ante ac pretium. Vivamus sodales hendrerit tortor et cursus. Aenean non est mattis magna accumsan iaculis sed eget mi. Pellentesque dictum volutpat tempor. Morbi eleifend orci a quam rutrum tincidunt.
            
            Mauris venenatis massa non lobortis consequat. Sed eleifend aliquet erat id pretium. Donec efficitur purus non suscipit maximus. Pellentesque suscipit vestibulum enim at iaculis. Phasellus ornare blandit rutrum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed nec pharetra tortor, nec dignissim neque. Integer leo velit, convallis ornare vestibulum eu, rutrum sed urna. Nulla euismod ultrices gravida. Morbi interdum nisl tortor, sodales viverra dolor auctor vel.
            
            """ ,
              style: AppTextStyle.h3.copyWith(
                fontSize: 14.sp,
              ),

            ),
          ]),
        ),
      ),
    );
  }
}
