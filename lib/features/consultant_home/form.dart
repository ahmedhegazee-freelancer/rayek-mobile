import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rayik/core/constants/hexa_color.dart';
import 'package:rayik/core/constants/strings.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/constants/color_manager.dart';
import '../../core/constants/dimensions.dart';
import '../../core/constants/icon_manager.dart';
import '../../core/theme/fonts_style.dart';

part 'utils/title.dart';
part 'utils/dash_containers.dart';
part 'utils/rating_container.dart';

class ConsultantHome extends StatelessWidget {
  const ConsultantHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 150.h,
              backgroundColor: ColorManager.primaryColor,
              flexibleSpace: const FlexibleSpaceBar(
                background: _Title(),
                collapseMode: CollapseMode.parallax,
              ),
              pinned: true,
              automaticallyImplyLeading: false,
              actions: [
                Padding(
                  padding: EdgeInsets.only(
                    left: Dimensions.defaultPadding,
                    right: Dimensions.defaultPadding,
                  ),
                  child: CircleAvatar(
                    radius: 20.r,
                    backgroundColor: ColorManager.primaryColor.withOpacity(.45),
                    child: Center(
                      child: SvgPicture.asset(
                        IconManager.notification,
                        width: 22.w,
                        height: 22.h,
                        colorFilter: const ColorFilter.mode(
                          ColorManager.whiteTextColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ];
        },
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.defaultPadding,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    Strings.dashboard.tr(),
                    style: AppTextStyle.titleStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    Strings.manageAndViewById.tr(),
                    style: AppTextStyle.subtitleStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              const _DashContainers(),
              SizedBox(height: 20.h,),
              _RatingContainer()
            ],
          ),
        )
      ),
    );
  }
}
