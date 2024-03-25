import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rayik/core/constants/color_manager.dart';
import 'package:rayik/core/constants/dimensions.dart';
import 'package:rayik/core/constants/icon_manager.dart';
import 'package:rayik/core/theme/fonts_style.dart';
import 'package:rayik/widgets/back_button.dart';
import 'package:rayik/widgets/custom_button.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/constants/strings.dart';
import '../consultant_page/form.dart';

part 'utils/save_button.dart';
part 'utils/hide_status.dart';
part 'utils/upload_image.dart';
part 'utils/profile_form.dart';


class EditProfileForm extends StatelessWidget {
  const EditProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Dimensions.defaultPadding),
        child: ListView(
          children: [
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 15.r,
                  backgroundColor: ColorManager.primaryColor.withOpacity(.2),
                  child: Center(
                    child:  CustomBackButton(
                      size: 15.sp,
                      color: ColorManager.primaryColor,
                      isColored: true,
                      iosOnly: true,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              Strings.updateProfile.tr(),
              style: AppTextStyle.h1,
            ),
            SizedBox(height: 10.h),
            Text(
              Strings.createYourProfile.tr(),
              style: AppTextStyle.h6,
            ),
            SizedBox(height: 25.h),
            // Upload Image
            _UploadContainer(),
            SizedBox(height: 20.h),
            const _HideStatus(),
            SizedBox(height: 20.h),
            _ButtonSave(),

          ],
        ),
      ),
    );
  }
}



