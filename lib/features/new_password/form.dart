import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rayik/core/constants/dimensions.dart';

import '../../core/constants/strings.dart';
import '../../core/theme/fonts_style.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Dimensions.defaultPadding),
        child: GestureDetector(
          onTap: () {
            // hide keyboard when user taps outside the text field
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              const CustomBackButton(),
              SizedBox(
                height: 50.h,
              ),
              Text(
                Strings.enterNewPassword.tr(),
                style: AppTextStyle.titleStyle,
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: .8.sw,
                child: Text(
                  Strings.pleaseEnterPassword.tr(),
                  style: AppTextStyle.subtitleStyle,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              CustomTextField(
                topText: Strings.password.tr(),
                isTopText: true,
                hintText: Strings.password.tr(),
                svgPrefix: false,
                obscure: true,
                controller: null,
                hasPrefix: false,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomTextField(
                topText: Strings.confirmPassword.tr(),
                isTopText: true,
                hintText: Strings.confirmPassword.tr(),
                svgPrefix: false,
                obscure: true,
                hasPrefix: false,
                controller: null,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: 35.h,
              ),
              CustomButton(
                onTap: () {
                  // reset password
                },
                text: Strings.confirmNewPassword.tr(),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
