
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/bloc/dark_light_bloc/cubit.dart';
import '../core/constants/app_constants.dart';
import '../core/constants/color_manager.dart';
import '../core/theme/fonts_style.dart';
import 'back_button.dart';

class CustomSliverPage extends StatelessWidget {
  final Widget? image;
  final Widget? body;
  final double? imageHeight;
  final Color? collapsedColor;
  final Color? expandedColor;
  final List<Widget>? actions;

  const CustomSliverPage({
    Key? key,
    this.image,
    this.body,
    this.imageHeight,
    this.collapsedColor,
    this.expandedColor,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeState themeState = context.watch<ThemeCubit>().state;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: const SizedBox(),
            backgroundColor:
            _getSliverAppBarColor(context), // Dynamic color based on scroll state
            actions: actions ??
                [
                  // SizedBox(
                  //   width: 10.w,
                  // ),
                  // Text(
                  //   AppConstants.appName,
                  //   style: AppTextStyle.h1,
                  // ),
                  const Spacer(),

                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: CircleAvatar(
                      radius: 15.r,
                      backgroundColor:
                      themeState == ThemeState.dark
                          ? ColorManager.newDarkGrey
                          : ColorManager.primaryColor.withOpacity(.4),
                      child: Center(
                        child: CustomBackButton(
                          size: 15.sp,
                          color: ColorManager.whiteTextColor,
                          isColored: true,
                          iosOnly: true,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                ],
            expandedHeight: imageHeight ?? 200.0.h,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const SizedBox(),
              background: image ?? const SizedBox(),
              //collapseMode: CollapseMode.parallax,
            ),
          ),
          SliverToBoxAdapter(
            child: body ?? const SizedBox(),
          ),
        ],
      ),
    );
  }

  Color _getSliverAppBarColor(BuildContext context) {
    ThemeState themeState = context.watch<ThemeCubit>().state;
    final FlexibleSpaceBarSettings? settings =
    context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
    final offset = settings?.currentExtent ?? 0.0;

    // Adjust color transition based on your preference (consider color weights)
    if (offset > (imageHeight ?? 200.0) * 0.8) {
      return expandedColor ??
          (themeState == ThemeState.dark
              ? ColorManager.blackTextColor
              : ColorManager.primaryColor.withOpacity(.4));// Fully expanded
    } else {
      return expandedColor ??
          (themeState == ThemeState.dark
              ? ColorManager.blackTextColor
              : ColorManager.primaryColor.withOpacity(.4));// Transitioning or collapsed
    }
  }
}



/// Rounded Sliver Page

class RoundedCustomSliverPage extends StatelessWidget {
  final Widget? image;
  final Widget? body;
  final double? imageHeight;
  final Color? collapsedColor;
  final Color? expandedColor;
  final List<Widget>? actions;

  const RoundedCustomSliverPage({
    Key? key,
    this.image,
    this.body,
    this.imageHeight,
    this.collapsedColor,
    this.expandedColor,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: const SizedBox(),
            backgroundColor:
            _getSliverAppBarColor(context), // Dynamic color based on scroll state
            actions: actions ?? [],
            expandedHeight: imageHeight ?? 200.0.h,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const SizedBox(),
              background: image ?? const SizedBox(),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: body ?? const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }

  Color _getSliverAppBarColor(BuildContext context) {
    final FlexibleSpaceBarSettings? settings =
    context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
    final offset = settings?.currentExtent ?? 0.0;

    // Adjust color transition based on your preference (consider color weights)
    if (offset > (imageHeight ?? 200.0) * 0.8) {
      return expandedColor ?? ColorManager.primaryColor; // Fully expanded
    } else {
      return collapsedColor ?? ColorManager.primaryColor; // Transitioning or collapsed
    }
  }
}