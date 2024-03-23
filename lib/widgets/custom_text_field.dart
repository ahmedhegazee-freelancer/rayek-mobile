import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rayik/core/constants/dimensions.dart';
import 'package:rayik/core/theme/fonts_style.dart';

import '../../core/constants/color_manager.dart';
import '../core/bloc/obsecure_text/obsecure_cubit.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final FormFieldSetter? onSaved;
  final FormFieldValidator? validate;
  final Color? borderColor;
  final double? borderWidth;
  final IconData? prefixIcon;
  final bool? svgPrefix;
  final Widget? suffixIcon;
  final bool obscure;
  final TextEditingController? controller;
  final TextAlign? textAlign;
  final bool? readonly;
  final TextInputType? keyboardType;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onFieldSubmitted;
  final int? maxLines;
  final bool hasPrefix;
  final String? svgIconPrefix;
  final double? heightOfTextField;
  final BorderRadius? borderRadius;
  final String? topText;
  final bool? isTopText;
  final double? gapTopText;
  final String? svgIconSuffix;


  const CustomTextField(
      {super.key,
      this.hintText,
      this.topText,
      this.isTopText,
      this.gapTopText,
      this.heightOfTextField,
      this.borderRadius,
      this.svgIconPrefix,
      this.svgIconSuffix,
      this.onSaved,
      this.validate,
      this.obscure = false,
      this.prefixIcon,
      this.svgPrefix = false,
      this.readonly = false,
      this.controller,
      this.labelText,
      this.hasPrefix = true,
      this.maxLines,
      this.suffixIcon,

      this.textAlign,
      this.borderColor,
      this.borderWidth,
      this.keyboardType,
      this.onTap,
      this.onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ObscureTextCubit(),
      child: BlocBuilder<ObscureTextCubit, bool>(builder: (context, secure) {
        return Column(
          children: [
            if (isTopText ?? false)
              Padding(
                padding: EdgeInsets.only(top: Dimensions.defaultPadding),
                child: Align(
                  alignment: context.locale.toString() == "ar"
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Text(
                    topText ?? "",
                    style: AppTextStyle.subTitleOfTextField,
                  ),
                ),
              ),
            SizedBox(
              height: gapTopText ?? 10.0.h,
            ),
            Container(
              height: heightOfTextField ?? 47.h,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: borderColor ?? ColorManager.fadeGreyBorderColor,
                    width: borderWidth ?? 2.w,
                  ),
                  borderRadius: BorderRadius.circular(Dimensions.buttonRadius)),
              child: TextFormField(
                  maxLines: maxLines ?? 1,
                  onFieldSubmitted: onFieldSubmitted,
                  controller: controller,
                  obscureText: obscure ? !secure : false,
                  onSaved: onSaved,
                  validator: validate,
                  autofocus: false,
                  onTap: onTap,
                  readOnly: readonly!,
                  keyboardType: keyboardType,
                  textAlign: textAlign ?? TextAlign.start,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    // errorText: 'nada error',
                    errorStyle: TextStyle(fontSize: 12.sp, height: 0.042.h),

                    prefixIcon: hasPrefix
                        ? svgPrefix ?? false
                            ? SizedBox(
                                width: 80.w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(0.0.sp),
                                      child: SvgPicture.asset(
                                        svgIconPrefix ?? "",
                                        color: ColorManager.lightGreyColor,
                                        width: 20.w,
                                        height: 20.h,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.w),
                                      child: SizedBox(
                                          height: 30.h,
                                          child: VerticalDivider(
                                            color: ColorManager.whiteGreyColor,
                                            width: 1.w,
                                            thickness: 1.w,
                                          )),
                                    )
                                  ],
                                ),
                              )
                            : SizedBox(
                                width: 80.w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      prefixIcon,
                                      color: ColorManager.lightGreyColor,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.w),
                                      child: SizedBox(
                                          height: 30.h,
                                          child: VerticalDivider(
                                            color: ColorManager.whiteGreyColor,
                                            width: 1.w,
                                            thickness: 1.w,
                                          )),
                                    )
                                  ],
                                ),
                              )
                        : const SizedBox(),
                    suffixIcon:


                    SizedBox(
                      height: 8.76.h,
                      width: 14.02.w,
                      child: GestureDetector(
                        onTap: () {
                          context.read<ObscureTextCubit>().toggle();
                        },
                        child: obscure
                            ? suffixIcon ??
                                Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: !secure
                                      ? ColorManager.lightGreyColor
                                      : ColorManager.primaryColor
                                          .withOpacity(.5),
                                )
                            : svgIconSuffix != null
                                ? Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: SvgPicture.asset(
                                      svgIconSuffix ?? "",
                                      color: ColorManager.lightGreyColor,
                                      width: 10.w,
                                      height: 10.h,
                                    ),
                                )
                                : const SizedBox()
                      ),
                    ),
                    hintText: hintText,

                    labelStyle: TextStyle(
                        color: ColorManager.lightGreyColor, fontSize: 12.sp),
                    hintStyle: AppTextStyle.hintTextField,
                    labelText: labelText,
                    floatingLabelBehavior: FloatingLabelBehavior.always,

                    focusedBorder: InputBorder.none,

                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),

                    border: InputBorder.none,
                  )),
            ),
          ],
        );
      }),
    );
  }
}
