import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/dimensions.dart';
import 'widgets/body1_widget.dart';
import 'widgets/body2_widget.dart';
import 'widgets/body3_widget.dart';
import 'widgets/body4_widget.dart';
import 'widgets/body5_widget.dart';

import '../../core/constants/color_manager.dart';
import '../../widgets/back_button.dart';
import 'cubit/edit_profile_setting_cubit.dart';

class EditProfileSettingScreen extends StatelessWidget {
  const EditProfileSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileSettingCubit(),
      child: BlocConsumer<EditProfileSettingCubit, EditProfileSettingState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = EditProfileSettingCubit.get(context);
          final currentIndex = cubit.currentIndex;
          return Scaffold(
            body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 100.h,
                    backgroundColor: Colors.transparent,
                    surfaceTintColor: Colors.transparent,
                    // flexibleSpace: const FlexibleSpaceBar(
                    //   // background: Container(
                    //   //   height: 150.h,
                    //   //   color: Theme.of(context).scaffoldBackgroundColor,
                    //   //   child: Column(
                    //   //     children: [
                    //   //       const _Title(),
                    //   //       const _SearchArea(),
                    //   //       SizedBox(
                    //   //         height: 10.h,
                    //   //       ),
                    //   //     ],
                    //   //   ),
                    //   // ),
                    //   collapseMode: CollapseMode.parallax,
                    // ),
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
                          backgroundColor:
                              ColorManager.primaryColor.withOpacity(.45),
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
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Align(
                        //   alignment: Alignment.centerLeft,
                        //   child: CircleAvatar(
                        //     radius: 15.r,
                        //     backgroundColor:
                        //         ColorManager.primaryColor.withOpacity(.45),
                        //     child: Center(
                        //       child: Center(
                        //         child: CustomBackButton(
                        //           size: 15.sp,
                        //           color: ColorManager.whiteTextColor,
                        //           isColored: true,
                        //           iosOnly: true,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(height: 16.h),
                        const Text(
                          "تعديل الملف الشخصي",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff151628)),
                        ),
                        SizedBox(height: 8.h),
                        const Text(
                          "عدل ملفك الشخصي",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff9C9C9C)),
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 10.h,
                                decoration: BoxDecoration(
                                  color: currentIndex == 0
                                      ? const Color(0xff1FBAD6)
                                      : const Color(0xffECEBEB),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Expanded(
                              child: Container(
                                height: 10.h,
                                decoration: BoxDecoration(
                                  color: currentIndex == 1
                                      ? const Color(0xff1FBAD6)
                                      : const Color(0xffECEBEB),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Expanded(
                              child: Container(
                                height: 10.h,
                                decoration: BoxDecoration(
                                  color: currentIndex == 2
                                      ? const Color(0xff1FBAD6)
                                      : const Color(0xffECEBEB),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Expanded(
                              child: Container(
                                height: 10.h,
                                decoration: BoxDecoration(
                                  color: currentIndex == 3
                                      ? const Color(0xff1FBAD6)
                                      : const Color(0xffECEBEB),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Expanded(
                              child: Container(
                                height: 10.h,
                                decoration: BoxDecoration(
                                  color: currentIndex == 4
                                      ? const Color(0xff1FBAD6)
                                      : const Color(0xffECEBEB),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        currentIndex == 0
                            ? const BodyOneWidget()
                            : currentIndex == 1
                                ? const BodyTwoWidget()
                                : currentIndex == 2
                                    ? const BodyThreeWidget()
                                    : currentIndex == 3
                                        ? const BodyFourWidget()
                                        : const BodyFiveWidget(),
                        SizedBox(height: 16.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
