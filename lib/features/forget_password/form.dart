
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rayik/core/constants/dimensions.dart';
import 'package:rayik/core/router/router.dart';
import 'package:rayik/features/otp_screen/form.dart';

import '../../core/constants/strings.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:rayik/core/theme/fonts_style.dart';

import 'package:rayik/widgets/custom_button.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/phone_code_picker.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

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
              // Back button
              const CustomBackButton(),

              SizedBox(
                height: 50.h,
              ),
              Text(
                Strings.retrievePassword.tr(),
                style: AppTextStyle.titleStyle,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                Strings.theResetLink.tr(),
                style: AppTextStyle.subtitleStyle,
              ),
              SizedBox(
                height: 25.h,
              ),
              BlocProvider(
                create: (context) => PhonePickerBloc(),
                child: CustomTextField(
                  topText: Strings.phoneNumber.tr(),
                  isTopText: true,
                  hintText: Strings.phoneNumber.tr(),
                  svgPrefix: true,
                  obscure: false,
                  controller: null,
                  isPhone: true,
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.phone,
                  hasPrefix: false,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              CustomButton(onTap: () {
                MagicRouter.navigateTo(const PinCodeScreen());
              }, text: Strings.confirm.tr()),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


