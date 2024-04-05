import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rayik/core/constants/dimensions.dart';
import 'package:shimmer/shimmer.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../core/constants/color_manager.dart';
import '../../core/constants/icon_manager.dart';
import '../../core/constants/strings.dart';
import '../../core/router/router.dart';
import '../../core/theme/fonts_style.dart';
import '../../core/theme/theme.dart';
import '../../widgets/custom_button.dart';
import '../consultant_page/form.dart';
import '../mian_home/page.dart';
import 'cubit/toggle_cubit/cubit.dart';

part 'utils/title.dart';
part 'utils/toggle_list.dart';
part 'utils/empty_calls.dart';

class VideoCallsForm extends StatelessWidget {
  const VideoCallsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ToggleCallsCubit>(
      create: (context) => ToggleCallsCubit(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            top: Dimensions.defaultPadding,
            left: Dimensions.defaultPadding,
            right: Dimensions.defaultPadding,
          ),
          child: Column(
            children: [
              const _Title(),
              SizedBox(
                height: 0.h,
              ),
              const ToggleList(),
              BlocConsumer<ToggleCallsCubit, ToggleState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return state.index != 0
                        ? Expanded(
                            child: ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    ListTile(
                                        title: Text(
                                            context.locale.toString() == 'ar'
                                                ? 'دعاء رياض'
                                                : 'Doaa Reyad',style: AppTextStyle.h3,),
                                        subtitle: Text('10:00 AM',style: AppTextStyle.subtitleStyle.copyWith(color: ColorManager.greyTextColor)),
                                        trailing: index % 2 == 0
                                            ? SvgPicture.asset(
                                                IconManager.video,
                                                colorFilter:
                                                    const ColorFilter.mode(
                                                        ColorManager
                                                            .blackTextColor,
                                                        BlendMode.srcIn),
                                                width: 22.w,
                                              )
                                            : Icon(
                                                Icons.call,
                                                color:
                                                    ColorManager.blackTextColor,
                                                size: 22.5.sp,
                                              ),
                                        leading:
                                            // rounded Container with child CachedNetworkImage
                                            Container(
                                          width: 50.w,
                                          height: 50.h,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50.r),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  'https://th.bing.com/th/id/R.58f60f6b81ae6d054b6b4910a9771fbf?rik=%2fKjN%2fqPR7wXaUw&pid=ImgRaw&r=0',
                                              placeholder: (context, url) =>
                                                  Shimmer(
                                                      gradient:
                                                          const LinearGradient(
                                                              begin: Alignment
                                                                  .topLeft,
                                                              end: Alignment
                                                                  .bottomRight,
                                                              colors: [
                                                            ColorManager
                                                                .whiteTextColor,
                                                            ColorManager
                                                                .greyTextColor
                                                          ]),
                                                      child: Container(
                                                        width: 50.w,
                                                        height: 50.h,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: ColorManager
                                                              .primaryColor,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                      )),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                          ),
                                        )),
                                    const Divider(),
                                  ],
                                );
                              },
                            ),
                          )
                        : const EmptyCalls();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
