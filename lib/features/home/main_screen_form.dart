import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rayik/core/constants/dimensions.dart';
import 'package:rayik/core/constants/hexa_color.dart';
import 'package:rayik/core/constants/icon_manager.dart';
import 'package:rayik/core/router/router.dart';
import 'package:rayik/core/theme/fonts_style.dart';
import 'package:rayik/features/categories_view/form.dart';
import 'package:rayik/features/home/utils/categories_widget.dart';
import 'package:rayik/features/home/utils/top_consultants.dart';
import 'package:rayik/features/my_appoints_view/form.dart';
import 'package:rayik/widgets/custom_text_field.dart';
import '../../core/constants/color_manager.dart';
import '../../core/constants/strings.dart';
import '../../widgets/back_button.dart';
import '../contact_us/form.dart';
import '../edit_profile/form.dart';
import '../search_view/form.dart';
import '../select_language_form/form.dart';
part 'utils/search_area.dart';
part 'utils/view_all_row.dart';
part 'utils/image_drawer.dart';
part 'utils/custom_drawer.dart';
part 'utils/drawer_items.dart';

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
              const _SearchArea(),
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
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    const TopConsultantsListView()
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


