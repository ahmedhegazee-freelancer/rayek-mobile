import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rayik/core/constants/dimensions.dart';
import 'package:rayik/core/router/router.dart';
import 'package:rayik/features/login/utils/select_user_type.dart';
import 'package:rayik/widgets/skip_button.dart';
import '../../core/constants/strings.dart';
import '../../core/theme/fonts_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/terms_and_conditions.dart';
import '../login/form.dart';

part 'utils/signup_form.dart';


class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(
          left: Dimensions.defaultPadding.w,
          right: Dimensions.defaultPadding.w,
          top: Dimensions.defaultPadding.h,
        ),
        child: GestureDetector(
          onTap: () {
            // hide keyboard when user taps outside the text field
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.signUp.tr(),
                    style: AppTextStyle.titleStyle,
                  ),
                  const SkipButton()
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    Strings.signupNowAndStart.tr(),
                    style: AppTextStyle.subtitleStyle,
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    const SelectUserType(),
                    SizedBox(
                      height: 15.h,
                    ),
                    const _SignUpDataForm(),
                    SizedBox(
                      height: 25.h,
                    ),
                    CustomButton(onTap: () {}, text: Strings.signUp.tr()),
                    // SizedBox(
                    //   height: 15.h,
                    // ),
                    // const SocialSign(isLogin: false),
                    SizedBox(
                      height: 30.h,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Strings.alreadyHaveAccount.tr(),
                          style: AppTextStyle.h3,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        InkWell(
                          onTap: () {
                            MagicRouter.navigateTo(const LoginView());
                          },
                          child: Text(
                            Strings.login.tr(),
                            style: AppTextStyle.subtitleStyle,
                          ),
                        ),
                      ],
                    ),
                    const TermsAndConditions(isLogin: false),
                  ],

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
