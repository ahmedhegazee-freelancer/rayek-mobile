import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:rayik/core/constants/app_constants.dart';
import '../core/constants/color_manager.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final FontWeight fontWeight;
  final TextAlign? align;
  final double? height;
  final TextDirection? textDirection;
  final int? lines;
  final TextStyle? style;
  final TextOverflow? textOverFlow;

  const CustomText(
      {Key? key,
      this.lines,
      this.style,
      this.textDirection,
      this.height,
      this.align,
      required this.text,
      this.color = Colors.black,
      this.fontSize,
      this.fontWeight = FontWeight.bold,
      this.textOverFlow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text == null ? '' : text ?? "".tr(),
      textDirection: textDirection,
      softWrap: true,

      style: style ??
          TextStyle(
            height: height,
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color ?? ColorManager.optionTextColor,
            overflow: textOverFlow,
            fontFamily: context.locale == const Locale('ar')
                ? AppConstants.arabicFont
                : AppConstants.englishFont,
          ),
      maxLines: lines,
      //overflow: TextOverflow.ellipsis,
      textAlign: align ?? TextAlign.center,
    );
  }
}
