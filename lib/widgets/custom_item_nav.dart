import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../core/bloc/dark_light_bloc/cubit.dart';
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
    ThemeState themeState = context.watch<ThemeCubit>().state;

    return Column(
      children: [
        SvgPicture.asset(icon ?? "",
            colorFilter: isSelected ?? false
                ? const ColorFilter.mode(
                    ColorManager.primaryColor, BlendMode.srcIn)
                :
                // theme
                themeState == ThemeState.dark
                    ? const ColorFilter.mode(
                        ColorManager.greyTextColor, BlendMode.srcIn)
                    : const ColorFilter.mode(
                        ColorManager.blackTextColor, BlendMode.srcIn)),
        SizedBox(
          height: 5.h,
        ),
        Text(title ?? "",
            style: isSelected ?? false
                ? AppTextStyle.h6
                    .copyWith(color: ColorManager.primaryColor, fontSize: 12.sp)
                : AppTextStyle.h4Grey
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 12.sp)),
      ],
    );
  }
}
