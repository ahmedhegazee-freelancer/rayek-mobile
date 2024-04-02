import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rayik/core/constants/color_manager.dart';
import 'package:rayik/core/constants/icon_manager.dart';
import 'package:rayik/features/login/form.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rayik/core/router/router.dart';



class SplashForm extends StatefulWidget {
  const SplashForm({super.key});

  @override
  State<SplashForm> createState() => _SplashFormState();
}

class _SplashFormState extends State<SplashForm> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      MagicRouter.navigateTo(const LoginView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.blackTextColor,
      body: Center(
        child: Shimmer.fromColors(
          baseColor: ColorManager.whiteTextColor,
          highlightColor: ColorManager.blackTextColor,
          child: SvgPicture.asset(
            IconManager.logo1,
            width: 200.w,
            height: 200.h,
            colorFilter: const ColorFilter.mode(
                ColorManager.whiteTextColor, BlendMode.srcIn)
          ),
        ),

        )

    );
  }
}
