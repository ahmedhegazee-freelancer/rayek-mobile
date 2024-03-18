import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/color_manager.dart';
import '../core/constants/strings.dart';
import '../core/theme/fonts_style.dart';

class TermsAndConditions extends StatelessWidget {
  final bool? isLogin;
  const TermsAndConditions({
    super.key,
    this.isLogin,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 1.sh * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isLogin ?? true
                ? Strings.loginAgreement.tr()
                : Strings.bySigningUp.tr(),
            style: AppTextStyle.h6,
          ),
          SizedBox(
            width: 5.w,
          ),
          InkWell(
            onTap: () {},
            child: Text(
              Strings.termsAndConditions.tr(),
              style: TextStyle(
                fontSize: 12.sp,
                decoration: TextDecoration.underline,
                color: ColorManager.blackTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
