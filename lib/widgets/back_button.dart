import 'package:easy_localization/easy_localization.dart';
import 'package:rayik/core/constants/app_constants.dart';
import 'package:rayik/core/router/router.dart';
import 'package:flutter/material.dart';


class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        onPressed: () {
         MagicRouter.goBack();
        },
        icon: Icon(
          context.locale.languageCode == 'ar'
              ? AppConstants.platform.isIOS
              ? Icons.arrow_forward_ios
              : Icons.arrow_forward
              : AppConstants.platform.isAndroid
              ? Icons.arrow_back
              : Icons.arrow_back_ios,
        ),
      ),
    );
  }
}