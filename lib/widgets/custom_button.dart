import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rayik/core/constants/dimensions.dart';

import '../../core/constants/color_manager.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String? text;
  final double? width;
  final double? height;
  final Widget? iconData;
  final bool? isGap;
  final Color? color;
  final Color? txtColor;
  final TextStyle? textStyle;
  final bool? isColored;
  final Color? borderColor;
  final double? fontSize;
  final double? radius;
  final double? borderWidth;

  const CustomButton(
      {Key? key,
      required this.onTap,
      this.textStyle,
      this.borderWidth,
      this.iconData,
      required this.text,
      this.width,
      this.height,
      this.isGap = false,
      this.color,
      this.txtColor,
      this.radius,
      this.isColored = true,
      this.borderColor,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: width,
          height: height ?? 47.h,
          decoration: BoxDecoration(
              color: isColored!
                  ? color == null
                      ? ColorManager.blackTextColor
                      : color ?? ColorManager.blackTextColor
                  : Colors.white,
              borderRadius:
                  BorderRadius.circular(radius ?? Dimensions.buttonRadius),
              border: Border.all(
                width:borderWidth?? 1,
                color: borderColor ?? Colors.transparent,
              )),
          child: Center(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
            child: Row(
              mainAxisAlignment: iconData == null || isGap == false
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: text,
                  style: textStyle,
                  color: txtColor ??
                      (isColored! ? Colors.white : ColorManager.primaryColor),
                  fontSize: fontSize ?? 16.sp,
                ),
                iconData == null
                    ? const SizedBox()
                    : iconData!,
              ],
            ),
          ))),
    );
  }
}
