import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rayik/core/constants/dimensions.dart';

import '../../core/constants/color_manager.dart';
import '../../core/constants/icon_manager.dart';
import '../../core/constants/strings.dart';
import '../../core/theme/fonts_style.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_text_field.dart';

part 'utils/search_area.dart';
part 'utils/filter_button.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Dimensions.defaultPadding),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
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
            const _TitleArea(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextField(
                  hintText: Strings.searchHere.tr(),
                  obscure: false,
                  hasPrefix: false,
                  svgIconSuffix: IconManager.searchIcon,
                  readonly: false,
                  heightOfTextField: 47.h,
                  width: 0.72.sw,

                ),
                SizedBox(
                  width: 9.w,
                ),
                _FilterButton(),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
