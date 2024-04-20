import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rayik/core/constants/dimensions.dart';
import 'package:shimmer/shimmer.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../core/bloc/dark_light_bloc/cubit.dart';
import '../../core/constants/color_manager.dart';
import '../../core/constants/icon_manager.dart';
import '../../core/constants/strings.dart';
import '../../core/router/router.dart';
import '../../core/theme/fonts_style.dart';
import '../../core/theme/theme.dart';
import '../../widgets/custom_button.dart';
import '../appointment_details/form.dart';
import '../consultant_page/form.dart';
import '../mian_home/page.dart';
import 'cubit/toggle_cubit/cubit.dart';

part 'utils/title.dart';
part 'utils/toggle_list.dart';
part 'utils/empty_calls.dart';
part 'utils/call_item.dart';

class VideoCallsForm extends StatelessWidget {
  const VideoCallsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ToggleCallsCubit>(
      create: (context) => ToggleCallsCubit(),
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 180.h,
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
                      backgroundColor:
                      ColorManager.primaryColor.withOpacity(.45),
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
          body: BlocConsumer<ToggleCallsCubit, ToggleState>(
            listener: (context, state) {},
            builder: (context, state) {
              return state.index != 0
                  ? SizedBox(
                height: .7.sh,
                width: 1.sw,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        MagicRouter.navigateTo(const AppointmentDetailsForm());
                      },
                      child:const  _CallItem(),
                    );
                  },
                ),
              )
                  : const EmptyCalls();
            },
          ),
        ),
      ),
    );
  }
}

