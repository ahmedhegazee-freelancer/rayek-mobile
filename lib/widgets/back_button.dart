import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rayik/core/constants/app_constants.dart';
import 'package:rayik/core/router/router.dart';
import 'package:flutter/material.dart';

import '../core/bloc/dark_light_bloc/cubit.dart';

class CustomBackButton extends StatelessWidget {
  final Color? color;
  final bool? isColored;
  final bool? iosOnly;
  final double? radius;
  final double? size;
  final bool? isBack;
  // pass function to the constructor
  final Function()? onPressed;

  const CustomBackButton({
    this.color,
    this.isColored,
    this.iosOnly,
    this.radius,
    this.size,
    this.isBack,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>().state;
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        onPressed: () {
          isBack ?? true ? MagicRouter.goBack() : onPressed!();
        },
        icon: Icon(
          context.locale.languageCode == 'ar'
              ? AppConstants.platform.isIOS
                  ? Icons.arrow_forward_ios
                  : iosOnly ?? false
                      ? Icons.arrow_forward_ios
                      : Icons.arrow_forward
              : AppConstants.platform.isAndroid
                  ? iosOnly ?? false
                      ? Icons.arrow_forward_ios
                      : Icons.arrow_back
                  : Icons.arrow_forward_ios,
          color: isColored ?? false
              ? color
              : themeState == ThemeState.dark
                  ? Colors.white
                  : Colors.black,
          size: size ?? 24.sp,
        ),
      ),
    );
  }
}
