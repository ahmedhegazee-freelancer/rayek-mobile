import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rayik/core/constants/color_manager.dart';
import 'package:rayik/core/constants/dimensions.dart';
import 'package:rayik/core/router/router.dart';
import 'package:rayik/core/theme/fonts_style.dart';
import 'package:rayik/features/login/utils/select_user_type.dart';
import 'package:rayik/features/login/utils/social_sign.dart';
import 'package:rayik/features/signup/form.dart';
import 'package:rayik/widgets/custom_button.dart';
import '../../core/constants/strings.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/skip_button.dart';
import '../../widgets/terms_and_conditions.dart';
import '../forget_password/form.dart';

part 'utils/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

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
              SizedBox(
                height: 25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.login.tr(),
                    style: AppTextStyle.titleStyle,
                  ),
                  const SkipButton(),

                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                Strings.welcomeBack.tr(),
                style: AppTextStyle.subtitleStyle,
              ),
              SizedBox(
                height: 25.h,
              ),
              const SelectUserType(),
              SizedBox(
                height: 25.h,
              ),
              Text(
                Strings.enterDetails.tr(),
                style: AppTextStyle.h3,
              ),
              SizedBox(
                height: 15.h,
              ),
              const _LoginForm(),
              SizedBox(
                height: 8.h,
              ),
              GestureDetector(
                onTap: () {
                  MagicRouter.navigateTo(const ForgetPasswordForm());
                },
                child: Text(
                  Strings.forgetPassword.tr(),
                  style: AppTextStyle.subtitleStyle,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              CustomButton(onTap: () {}, text: Strings.login.tr()),
              SizedBox(
                height: 15.h,
              ),
              const SocialSign(),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Strings.noAccount.tr(),
                    style: AppTextStyle.h3,
                  ),
                  SizedBox(
                    width: 5.w,),
                  GestureDetector(
                    onTap: () {
                      MagicRouter.navigateTo(const SignUpForm());
                    },
                    child: Text(
                      Strings.subscribeNow.tr(),
                      style: AppTextStyle.subtitleStyle.copyWith(
                        color: ColorManager.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              const TermsAndConditions(),
            ],
          ),
        ),
      ),
    );
  }
}

