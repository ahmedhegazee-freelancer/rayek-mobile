import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/color_manager.dart';
import '../../core/constants/dimensions.dart';
import '../../core/constants/icon_manager.dart';
import '../../core/constants/strings.dart';
import '../../core/theme/fonts_style.dart';
import '../../widgets/back_button.dart';
import '../../widgets/consultant_container.dart';
import '../../widgets/custom_text_field.dart';


part 'utils/search_area.dart';
part 'utils/consultants.dart';

class ConsultantsView extends StatelessWidget {
  const ConsultantsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Dimensions.defaultPadding),
        child: Column(
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
            SizedBox(
              height: 10.h,
            ),
            const _SearchArea(),
            SizedBox(
              height: 20.h,
            ),
            const _ConsultantsListView(),
          ],
        ),
      ),
    );
  }
}
