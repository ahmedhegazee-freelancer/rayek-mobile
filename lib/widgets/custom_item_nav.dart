

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../core/constants/color_manager.dart';
import '../core/theme/fonts_style.dart';

class CustomNavBarItem extends StatelessWidget {
  final String? title;
  final String? icon;
  final bool? isSelected;
  const CustomNavBarItem({
    this.title,
    this.icon,
    this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(icon?? "",
          color: isSelected??false ? ColorManager.primaryColor : ColorManager.blackTextColor,
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          title?? "",
          style:
          isSelected??false ? AppTextStyle.h6.copyWith(color: ColorManager.primaryColor, fontSize: 12.sp) :
          AppTextStyle.h4Grey.copyWith(fontWeight: FontWeight.w400, fontSize: 12.sp)
        ),
      ],
    );
  }
}
