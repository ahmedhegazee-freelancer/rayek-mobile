import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/strings.dart';
import '../../../widgets/custom_button.dart';
import '../../consultant_page/form.dart';

class ButtonSave extends StatelessWidget {
  const ButtonSave({super.key, this.onTap});
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: .88.sw,
      text: Strings.nextStep.tr(),
      onTap: () {
        onTap?.call();
      },
      isGap: true,
      iconData: const BackIconInButton(),
    );
  }
}
