
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/color_manager.dart';
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
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: const SizedBox(),
            backgroundColor:
            _getSliverAppBarColor(context), // Dynamic color based on scroll state
            actions: actions ??
                [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: CircleAvatar(
                      radius: 15.r,
                      backgroundColor: ColorManager.whiteTextColor.withOpacity(.2),
                      child: Center(
                        child: CustomBackButton(
                          size: 15.sp,
                          color: ColorManager.blackTextColor,
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