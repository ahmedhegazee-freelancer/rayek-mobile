import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rayik/core/constants/color_manager.dart';
import 'package:rayik/core/theme/fonts_style.dart';
import 'package:rayik/widgets/custom_button.dart';

import '../../../core/constants/strings.dart';


class SelectUserType extends StatelessWidget {
  const SelectUserType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CustomButton(
          width: 155.w,
          textStyle: AppTextStyle.buttonBlackStyle,
          onTap: () {},
          text: Strings.user.tr()),
      SizedBox(
        width: 16.w,
      ),
      CustomButton(
          width: 155.w,
          color: ColorManager.greyButtonColor,
          textStyle: AppTextStyle.buttonWhiteStyle,
          onTap: () {},
          text: Strings.consultant.tr()),
    ]);
  }
}
