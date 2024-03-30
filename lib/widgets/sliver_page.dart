import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/color_manager.dart';
import 'back_button.dart';

class CustomSliverPage extends StatelessWidget {
  final Widget? image;
  final Widget? body;
  final double? imageHeight;

  const CustomSliverPage({Key? key, this.image, this.body, this.imageHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: const SizedBox(),
            backgroundColor: Colors.transparent,
            actions: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CircleAvatar(
                  radius: 15.r,
                  backgroundColor: ColorManager.greyTextColor.withOpacity(.2),
                  child: Center(
                    child: CustomBackButton(
                      size: 15.sp,
                      color: ColorManager.greyTextColor,
                      isColored: true,
                      iosOnly: true,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
            ], // change your color here
            expandedHeight: imageHeight ?? 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const SizedBox(),
              background: image ?? const SizedBox(),
            ),
          ),
          SliverToBoxAdapter(
            child: body ?? const SizedBox(),
          ),
        ],
      ),
    );
  }
}
