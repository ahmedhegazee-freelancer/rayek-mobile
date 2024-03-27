import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rayik/core/constants/color_manager.dart';
import '../../core/constants/dimensions.dart';
import '../../core/constants/icon_manager.dart';
import '../../core/constants/strings.dart';
import '../../core/router/router.dart';
import '../../core/theme/fonts_style.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_text_field.dart';
import '../consultants_view/form.dart';
import '../search_view/form.dart';

part 'utils/search_area.dart';
part 'utils/categories.dart';

class CategoriesView extends StatelessWidget {
  final bool? isFromDrawer;

  const CategoriesView({Key? key, this.isFromDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Dimensions.defaultPadding),
        child: Column(
          children: [
            SizedBox(
              height: isFromDrawer ?? false ? 20.h : 0,
            ),
            isFromDrawer ?? false
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 15.r,
                        backgroundColor:
                            ColorManager.primaryColor.withOpacity(.2),
                        child: Center(
                          child: CustomBackButton(
                            size: 15.sp,
                            color: ColorManager.primaryColor,
                            isColored: true,
                            iosOnly: true,
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(),
            SizedBox(
              height: isFromDrawer?? false? 10.h: 20.h,
            ),
            const _SearchArea(),
            SizedBox(
              height: 10.h,
            ),
            const _Categories(),
          ],
        ),
      ),
    );
  }
}
