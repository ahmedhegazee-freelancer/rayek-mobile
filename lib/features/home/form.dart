import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/dimensions.dart';
import '../../core/constants/hexa_color.dart';
import '../../core/constants/icon_manager.dart';
import '../../core/router/router.dart';
import '../../core/theme/fonts_style.dart';
import '../categories_view/form.dart';
import '../consultants_view/form.dart';
import 'utils/categories_widget.dart';
import 'utils/top_consultants.dart';
import '../login/form.dart';
import '../my_appoints_view/form.dart';
import '../../widgets/custom_text_field.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/bloc/dark_light_bloc/cubit.dart';
import '../../core/bloc/user_type/user_type.dart';
import '../../core/constants/color_manager.dart';
import '../../core/constants/strings.dart';
import '../../core/general_utils/general_utils.dart';
import '../all_consultants_view/form.dart';
import '../blog_screen/form.dart';
import '../contact_us/form.dart';
import '../edit_profile_settings/form.dart';
import '../edit_profile_user/form.dart';
import '../mian_home/page.dart';
import '../search_view/form.dart';
import '../select_language_form/form.dart';

part 'utils/custom_drawer.dart';
part 'utils/drawer_items.dart';
part 'utils/image_drawer.dart';
part 'utils/most_popular_articles.dart';
part 'utils/search_area.dart';
part 'utils/view_all_row.dart';

class MainScreenForm extends StatelessWidget {
  const MainScreenForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 18.h,
              ),
              //const _SearchArea(),
              SizedBox(
                height: 3.h,
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    _ViewAllRow(
                      title: Strings.categories.tr(),
                      route: const CategoriesView(isFromDrawer: true),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    const CategoriesWidget(),
                    SizedBox(
                      height: 12.h,
                    ),
                    _ViewAllRow(
                      title: Strings.topConsultants.tr(),
                      route: const AllConsultantsViewForm(),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    const TopConsultantsListView(),
                    SizedBox(
                      height: 12.h,
                    ),
                    _ViewAllRow(
                      title: Strings.sports.tr(),
                      route: const ConsultantsView(),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    const TopConsultantsListView(),
                    SizedBox(
                      height: 12.h,
                    ),
                    _ViewAllRow(
                      title: Strings.law.tr(),
                      route: const ConsultantsView(),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    const TopConsultantsListView(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
