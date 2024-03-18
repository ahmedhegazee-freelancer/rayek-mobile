import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rayik/core/constants/icon_manager.dart';
import 'package:rayik/core/theme/fonts_style.dart';
import '../../../core/constants/strings.dart';

class SocialSign extends StatelessWidget {
  final bool? isLogin;
  const SocialSign({Key? key, this.isLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            isLogin ?? true
                ? Strings.orLoinWith.tr()
                : Strings.orSignupWith.tr(),
            style: AppTextStyle.h4,
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        SizedBox(
          height: 50.h,
          width: 1.sw,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  IconManager.facebook,
                  width: 30.w,
                  height: 30.h,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              SvgPicture.asset(
                IconManager.google,
                width: 30.w,
                height: 30.h,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
