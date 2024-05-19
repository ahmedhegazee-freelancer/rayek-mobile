import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rayik/core/constants/image_manager.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/bloc/dark_light_bloc/cubit.dart';
import '../../core/constants/color_manager.dart';
import '../../core/constants/dimensions.dart';
import '../../core/constants/hexa_color.dart';
import '../../core/constants/icon_manager.dart';
import '../../core/constants/strings.dart';
import '../../core/router/router.dart';
import '../../core/theme/fonts_style.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_text_field.dart';
import '../consultant_page/form.dart';
import '../search_view/form.dart';

part 'utils/search_area.dart';
part 'utils/consultants_list_view.dart';
part 'utils/title.dart';
part 'utils/consultant_container.dart';

class AllConsultantsViewForm extends StatelessWidget {
  const AllConsultantsViewForm({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeState themeState = context.read<ThemeCubit>().state;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 132.h,
              backgroundColor: ColorManager.primaryColor,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: 150.h,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    children: [
                      const _Title(),
                      const _SearchArea(),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
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
                    radius: 15.r,
                    backgroundColor: ColorManager.primaryColor.withOpacity(.45),
                    child: Center(
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
                ),
              ],
            ),
          ];
        },
        body: DefaultTabController(
            length: 4,
            child: Scaffold(
                appBar: TabBar(
                  //controller: tabController,
                  indicatorColor: themeState == ThemeState.light
                      ? ColorManager.blackTextColor
                      : ColorManager.primaryColor,
                  labelColor: themeState == ThemeState.light
                      ? ColorManager.blackTextColor
                      : ColorManager.whiteTextColor,
                  unselectedLabelColor: ColorManager.greyTextColor,
                  tabs: [
                    Tab(
                      text: Strings.viewAll.tr(),
                    ),
                    Tab(
                      text: Strings.sports.tr(),
                    ),
                    Tab(
                      text: Strings.law.tr(),
                    ),
                    Tab(
                      text: Strings.education.tr(),
                    ),
                  ],
                ),
                body: const TabBarView(
                  children: [
                    ConsultantListView(),
                    ConsultantListView(),
                    ConsultantListView(),
                    ConsultantListView(),
                  ],
                ))),
      ),
    );
  }
}

