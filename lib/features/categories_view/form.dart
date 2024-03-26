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
import '../../widgets/custom_text_field.dart';
import '../consultants_view/form.dart';

part 'utils/search_area.dart';
part 'utils/categories.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

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