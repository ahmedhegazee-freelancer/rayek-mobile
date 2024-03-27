import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/color_manager.dart';
import '../../core/constants/strings.dart';
import '../../core/theme/fonts_style.dart';
import '../../widgets/back_button.dart';


part 'utils/my_appoints_title.dart';
class MyAppointsView extends StatelessWidget {
  const MyAppointsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const _MyAppointsTitle(),
          SizedBox(
            height: 20.h,
          ),
        ],
      )
    );
  }
}
