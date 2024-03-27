import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rayik/core/constants/dimensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constants/color_manager.dart';
import '../../core/constants/icon_manager.dart';
import '../../core/constants/strings.dart';
import '../../core/theme/fonts_style.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../consultant_page/form.dart';

part 'utils/contact_form.dart';
part 'utils/header_title.dart';
part 'utils/contact_settings.dart';

class ContactUsForm extends StatelessWidget {
  const ContactUsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Dimensions.defaultPadding),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: [
              ListView(
                children: [
                  SizedBox(height: 20.h),
                  const _ContactTitle(),
                  SizedBox(
                    height: 20.h,
                  ),
                  const _ContactSettings(),
                  SizedBox(
                    height: 25.h,
                  ),
                  const _ContactForm(),
                  SizedBox(
                    height: 100.h,
                  ),
                ],
              ),
              Positioned(
                bottom: 3.h,
                child:

                CustomButton(
                  text: Strings.send.tr(),
                  onTap: () {},
                  isGap: true,
                  width: .9.sw,
                  height: 46.h,
                  iconData: const BackIconInButton(),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
