
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../core/constants/strings.dart';
import '../core/theme/fonts_style.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add Home page route

      },
      child: Text(
        Strings.skip.tr(),
        style: AppTextStyle.h4Grey,
      ),
    );
  }
}
