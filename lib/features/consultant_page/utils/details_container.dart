import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rayik/core/theme/fonts_style.dart';
import '../../../core/constants/color_manager.dart';

class DetailsContainer extends StatelessWidget {
  final String? icon;
  final String? title;
  final String? subTitle;

  const DetailsContainer({
    this.icon,
    this.title,
    this.subTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorManager.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon == null
                    ? Container()
                    : SvgPicture.asset(
                        icon?? "",
                        height: 12.h,
                        width: 12.w,
                      ),
                SizedBox(width: 5.w),
                Text(
                  title ?? '',
                  style: AppTextStyle.h4Black,
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Text(
              subTitle ?? '',
              style: AppTextStyle.h4Grey,
            ),
          ],
        ),
      ),
    );
  }
}
