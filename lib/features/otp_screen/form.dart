import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rayik/core/constants/dimensions.dart';
import 'package:rayik/core/router/router.dart';
import 'package:rayik/core/theme/fonts_style.dart';
import 'package:rayik/features/otp_screen/utils/bin_code_widget.dart';
import 'package:rayik/widgets/custom_button.dart';
import '../../core/constants/strings.dart';
import '../../widgets/back_button.dart';
import '../new_password/form.dart';

part 'utils/resend_code.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({super.key});

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
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
              Strings.enterPin.tr(),
              style: AppTextStyle.titleStyle,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              Strings.pleaseEnterPin.tr(),
              style: AppTextStyle.subtitleStyle,
            ),
            SizedBox(
              height: 25.h,
            ),
            const PinCodeWidget(),
            SizedBox(
              height: 25.h,
            ),
            CustomButton(
              onTap: () {
                MagicRouter.navigateTo(const NewPasswordView());
              },
              text: Strings.verify.tr(),
            ),
            SizedBox(
              height: 10.h,
            ),
            const _ResendCode(),
          ],
        ),
      ),
    ));
  }
}
