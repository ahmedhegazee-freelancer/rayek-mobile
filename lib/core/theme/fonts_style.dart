import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color_manager.dart';

class AppTextStyle {
  static TextStyle titleStyle = TextStyle(
    fontSize: 29.0.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle subtitleStyle = TextStyle(
    fontSize: 13.0.sp,
    fontWeight: FontWeight.w400,
    color: ColorManager.primaryColor,
  );

  static TextStyle buttonBlackStyle = TextStyle(
    fontSize: 13.0.sp,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static TextStyle buttonWhiteStyle = TextStyle(
    fontSize: 13.0.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle subTitleOfTextField = TextStyle(
    fontSize: 14.0.sp,
    fontWeight: FontWeight.w500,
    color: ColorManager.blackTextColor,
  );

  static TextStyle hintTextField = TextStyle(
    fontSize: 13.0.sp,
    fontWeight: FontWeight.w400,
    color: ColorManager.lightGreyColor,
  );


  static TextStyle h3 = TextStyle(
    fontSize: 16.0.sp,
    fontWeight: FontWeight.w600,
    color: ColorManager.blackTextColor,
  );

  static TextStyle h4 = TextStyle(
    fontSize: 12.0.sp,
    fontWeight: FontWeight.w700,
    color: ColorManager.lightGreyColor,
  );

  static TextStyle h6 = TextStyle(
    fontSize: 10.0.sp,
    fontWeight: FontWeight.w400,
    color: ColorManager.blackTextColor,
  );
}
