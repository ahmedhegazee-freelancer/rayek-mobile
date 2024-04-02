import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rayik/core/constants/hexa_color.dart';
import 'package:rayik/core/router/router.dart';
import 'package:rayik/features/appointment_details/form.dart';
import 'package:shimmer/shimmer.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../core/constants/color_manager.dart';
import '../../core/constants/dimensions.dart';
import '../../core/constants/icon_manager.dart';
import '../../core/constants/strings.dart';
import '../../core/theme/fonts_style.dart';
import '../../core/theme/theme.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_button.dart';
import '../consultant_page/form.dart';
import '../mian_home/page.dart';
import 'cubit/toggle_cubit/cubit.dart';

part 'utils/my_appoints_title.dart';
part 'utils/toggle_list.dart';
part 'utils/appoints_list_view.dart';
part 'utils/empty_appoints.dart';
part 'utils/appoint_container.dart';

class MyAppointsView extends StatelessWidget {
  const MyAppointsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ToggleCubit>(
      create: (context) => ToggleCubit(),
      child: Scaffold(
          body: ListView(
        children: [
          const _MyAppointsTitle(),
          SizedBox(
            height: 20.h,
          ),
          const ToggleList(),
          SizedBox(
            height: 20.h,
          ),
          const AppointsListView(),
        ],
      )),
    );
  }
}
