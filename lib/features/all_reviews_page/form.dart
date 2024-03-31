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
import '../../widgets/review_item.dart';
part 'utils/title.dart';

class AllReviewForm extends StatelessWidget {
  const AllReviewForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: Dimensions.defaultPadding,
            left: Dimensions.defaultPadding,
            right: Dimensions.defaultPadding),
        child: Column(children: [
          const _Title(),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return const ReviewItem();
            },
            itemCount: 10,
          )),
        ]),
      ),
    );
  }
}
