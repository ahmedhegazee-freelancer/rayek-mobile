import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rayik/core/constants/dimensions.dart';
import 'package:rayik/core/constants/icon_manager.dart';
import 'package:rayik/core/router/router.dart';
import 'package:rayik/core/theme/fonts_style.dart';
import 'package:rayik/features/home/utils/categories_widget.dart';
import 'package:rayik/features/home/utils/top_consultants.dart';
import 'package:rayik/widgets/custom_text_field.dart';
import '../../core/constants/color_manager.dart';
import '../../core/constants/strings.dart';
import '../../widgets/custom_item_nav.dart';
import '../search_view/form.dart';
part "utils/top_bar.dart";
part 'utils/search_area.dart';
part 'utils/view_all_row.dart';

class MainScreenForm extends StatelessWidget {
  const MainScreenForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.shifting,
      //
      //   currentIndex: 0,
      //   items:  [
      //     BottomNavigationBarItem(
      //       icon: CustomNavBarItem(
      //         title: Strings.home.tr(),
      //         icon: IconManager.home,
      //         isSelected: true,
      //       ),
      //       label:  Strings.home.tr(),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: CustomNavBarItem(
      //         title: Strings.experts.tr(),
      //         icon: IconManager.experts,
      //       ),
      //       label:  Strings.experts.tr(),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: CustomNavBarItem(
      //         title: Strings.chat.tr(),
      //         icon: IconManager.chatNav,
      //       ),
      //       label: Strings.chat.tr(),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: CustomNavBarItem(
      //         title: Strings.call.tr(),
      //         icon: IconManager.videoNav,
      //       ),
      //       label: Strings.call.tr(),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: CustomNavBarItem(
      //         title: Strings.settings.tr(),
      //         icon: IconManager.settings,
      //       ),
      //       label: Strings.settings.tr(),
      //     ),
      //   ],
      //
      // ),
        body: ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        SizedBox(
          height: 12.h,
        ),
        // Top Row
        const _TopHomeBar(),

        // Search Bar
        SizedBox(
          height: 18.h,
        ),
        const _SearchArea(),
        // view all
        SizedBox(
          height: 12.h,
        ),
        _ViewAllRow(
          title: Strings.categories.tr(),
        ),
        // Categories
        SizedBox(
          height: 5.h,
        ),
        const CategoriesWidget(),
        SizedBox(
          height: 12.h,
        ),
        _ViewAllRow(
          title: Strings.topConsultants.tr(),
        ),
        // Best Consultants
        SizedBox(
          height: 5.h,
        ),
        const TopConsultantsListView()
      ],
    ));
  }
}


