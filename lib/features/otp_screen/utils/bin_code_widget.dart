import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rayik/core/constants/dimensions.dart';
import 'package:rayik/core/theme/fonts_style.dart';

import '../../../core/constants/color_manager.dart';

class PinCodeWidget extends StatelessWidget {
  const PinCodeWidget({Key? key, this.controller}) : super(key: key);
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: controller,
      length: 4,
      obscureText: false,
      animationType: AnimationType.fade,


      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
        selectedColor: ColorManager.whiteGreyColor,
        inactiveColor: ColorManager.whiteGreyColor,
        fieldHeight: 70.h,
        fieldWidth: 70.w,
        activeFillColor: Colors.white,
      ),
      cursorColor: ColorManager.primaryColor,
      cursorHeight: 30.h,
      cursorWidth: 2.w,
      enablePinAutofill: true,

      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.white,

      enableActiveFill: false,
      boxShadows: const [
        BoxShadow(
          offset: Offset(0, 1),
          color: Colors.black12,
          blurRadius: 10,
        )
      ],

      //   errorAnimationController: errorController,
      // controller: textEditingController,
      onCompleted: (v) {
        debugPrint("Completed");
      },
      onChanged: (value) {
        debugPrint(value);
      },
      beforeTextPaste: (text) {
        debugPrint("Allowing to paste $text");
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
      textCapitalization: TextCapitalization.characters,
      animationCurve: Curves.easeInOut,
      textStyle: AppTextStyle.titleStyle,
      appContext: context,
    );
  }
}
