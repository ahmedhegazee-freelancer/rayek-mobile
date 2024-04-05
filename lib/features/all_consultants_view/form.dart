import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/color_manager.dart';
import '../../core/constants/dimensions.dart';
import '../../core/constants/icon_manager.dart';
import '../../core/constants/strings.dart';
import '../../core/router/router.dart';
import '../../widgets/back_button.dart';
import '../../widgets/consultant_container.dart';
import '../../widgets/custom_text_field.dart';
import '../search_view/form.dart';

part 'utils/search_area.dart';
part 'utils/consultants_list_view.dart';
part 'utils/title.dart';

class AllConsultantsViewForm extends StatelessWidget {
  const AllConsultantsViewForm({super.key});

  @override
  Widget build(BuildContext context) {

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
                  color: ColorManager.whiteTextColor,
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
                  indicatorColor: ColorManager.blackTextColor,
                  labelColor: ColorManager.blackTextColor,
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
                    _ConsultantsListView(),
                    _ConsultantsListView(
                      itemCount: 1,
                    ),
                    _ConsultantsListView(
                      itemCount: 1,
                    ),
                    _ConsultantsListView(
                      itemCount: 1,
                    ),
                  ],
                ))),
      ),
    );
  }
}
