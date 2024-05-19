import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/dimensions.dart';
import '../../core/constants/strings.dart';
import '../../core/router/router.dart';
import '../../core/theme/fonts_style.dart';
import 'widgets/body1_widget.dart';
import 'widgets/body2_widget.dart';
import 'widgets/body3_widget.dart';
import 'widgets/body4_widget.dart';
import 'widgets/body5_widget.dart';
import '../../core/constants/color_manager.dart';
import '../../widgets/back_button.dart';
import 'cubit/edit_profile_setting_cubit.dart';
import 'widgets/save_button.dart';

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
          return DefaultTabController(
            initialIndex: cubit.currentIndex,
            length: 5,
            child: Builder(builder: (context) {
              return Scaffold(
                // bottomNavigationBar: SizedBox(
                //   height: 50,
                //   child: BottomAppBar(
                //     surfaceTintColor: Colors.transparent,
                //     color: Colors.transparent,
                //     child: ButtonSave(
                //       onTap: () {
                //         if (currentIndex != 4) {
                //           currentIndex++;
                //         }
                //         DefaultTabController.of(context)
                //             .animateTo(currentIndex);
                //         // cubit.changeCurrentIndex(currentIndex);
                //       },
                //     ),
                //   ),
                // ),
                body: WillPopScope(
                  onWillPop: () async {
                    final index = DefaultTabController.of(context).index;

                    index == 0
                        ? MagicRouter.goBack()
                        : {
                            cubit.currentIndex--,
                            DefaultTabController.of(context)
                                .animateTo(index - 1),
                          };
                    cubit.changeCurrentIndex();
                    return false;
                  },
                  child: NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverAppBar(
                          expandedHeight: 130.h,
                          backgroundColor: ColorManager.primaryColor,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Container(
                                height: 40.h,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                child: Padding(
                                  padding:
                                      EdgeInsets.all(Dimensions.defaultPadding),
                                  child: Column(children: [
                                    SizedBox(
                                      height: 60.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          Strings.updateProfile.tr(),
                                          style: AppTextStyle.h1,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          Strings.editProfile.tr(),
                                          style: AppTextStyle.h6,
                                        ),
                                      ],
                                    ),
                                  ]),
                                )),
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
                                backgroundColor:
                                    ColorManager.primaryColor.withOpacity(.45),
                                child: Center(
                                  child: Center(
                                    child: CustomBackButton(
                                      size: 15.sp,
                                      color: ColorManager.whiteTextColor,
                                      isColored: true,
                                      isBack: false,
                                      iosOnly: true,
                                      onPressed: () {
                                        final index =
                                            DefaultTabController.of(context)
                                                .index;

                                        index == 0
                                            ? MagicRouter.goBack()
                                            : {
                                                cubit.currentIndex--,
                                                DefaultTabController.of(context)
                                                    .animateTo(index - 1),
                                              };
                                        cubit.changeCurrentIndex();
                                      },
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
                      padding: EdgeInsets.all(Dimensions.defaultPadding),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Align(
                              //   alignment: AlignmentDirectional.centerEnd,
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
                              //           isBack: false,
                              //           iosOnly: true,
                              //           onPressed: () {
                              //             final index =
                              //                 DefaultTabController.of(context)
                              //                     .index;
                              //             index == 0
                              //                 ? MagicRouter.goBack()
                              //                 : DefaultTabController.of(context)
                              //                     .animateTo(index - 1);
                              //           },
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(height: 16.h),
                              // Text(
                              //   Strings.editProfile.tr(),
                              //   style: const TextStyle(
                              //       fontSize: 24,
                              //       fontWeight: FontWeight.w700,
                              //       color: Color(0xff151628)),
                              // ),
                              // SizedBox(height: 8.h),
                              // const Text(
                              //   "عدل ملفك الشخصي",
                              //   style: TextStyle(
                              //       fontSize: 14,
                              //       fontWeight: FontWeight.w400,
                              //       color: Color(0xff9C9C9C)),
                              // ),
                              // SizedBox(height: 16.h),
                              Row(
                                  children: List.generate(
                                5,
                                (index) => Expanded(
                                  child: Container(
                                    height: 10.h,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 4.w),
                                    decoration: BoxDecoration(
                                      color: DefaultTabController.of(context)
                                                  .index ==
                                              index
                                          ? const Color(0xff1FBAD6)
                                          : const Color(0xffECEBEB),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              )

                                  // [
                                  //   Expanded(
                                  //     child: Container(
                                  //       height: 10.h,
                                  //       decoration: BoxDecoration(
                                  //         color: currentIndex == 0
                                  //             ? const Color(0xff1FBAD6)
                                  //             : const Color(0xffECEBEB),
                                  //         borderRadius: BorderRadius.circular(10),
                                  //       ),
                                  //     ),
                                  //   ),
                                  //   SizedBox(
                                  //     width: 8.w,
                                  //   ),
                                  //   Expanded(
                                  //     child: Container(
                                  //       height: 10.h,
                                  //       decoration: BoxDecoration(
                                  //         color: currentIndex == 1
                                  //             ? const Color(0xff1FBAD6)
                                  //             : const Color(0xffECEBEB),
                                  //         borderRadius: BorderRadius.circular(10),
                                  //       ),
                                  //     ),
                                  //   ),
                                  //   SizedBox(
                                  //     width: 8.w,
                                  //   ),
                                  //   Expanded(
                                  //     child: Container(
                                  //       height: 10.h,
                                  //       decoration: BoxDecoration(
                                  //         color: currentIndex == 2
                                  //             ? const Color(0xff1FBAD6)
                                  //             : const Color(0xffECEBEB),
                                  //         borderRadius: BorderRadius.circular(10),
                                  //       ),
                                  //     ),
                                  //   ),
                                  //   SizedBox(
                                  //     width: 8.w,
                                  //   ),
                                  //   Expanded(
                                  //     child: Container(
                                  //       height: 10.h,
                                  //       decoration: BoxDecoration(
                                  //         color: currentIndex == 3
                                  //             ? const Color(0xff1FBAD6)
                                  //             : const Color(0xffECEBEB),
                                  //         borderRadius: BorderRadius.circular(10),
                                  //       ),
                                  //     ),
                                  //   ),
                                  //   SizedBox(
                                  //     width: 8.w,
                                  //   ),
                                  //   Expanded(
                                  //     child: Container(
                                  //       height: 10.h,
                                  //       decoration: BoxDecoration(
                                  //         color: currentIndex == 4
                                  //             ? const Color(0xff1FBAD6)
                                  //             : const Color(0xffECEBEB),
                                  //         borderRadius: BorderRadius.circular(10),
                                  //       ),
                                  //     ),
                                  //   ),
                                  //   SizedBox(
                                  //     width: 8.w,
                                  //   ),
                                  // ],
                                  ),
                              SizedBox(height: 16.h),
                              const Expanded(
                                  child: TabBarView(
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  BodyOneWidget(),
                                  BodyTwoWidget(),
                                  BodyThreeWidget(),
                                  BodyFourWidget(),
                                  BodyFiveWidget(),
                                ],
                              )),
                              SizedBox(height: 30.h),

                              // currentIndex == 0
                              //     ? const BodyOneWidget()
                              //     : currentIndex == 1
                              //         ? const BodyTwoWidget()
                              //         : currentIndex == 2
                              //             ? const BodyThreeWidget()
                              //             : currentIndex == 3
                              //                 ? const BodyFourWidget()
                              //                 : const BodyFiveWidget(),
                              SizedBox(height: 16.h),
                            ],
                          ),
                          Positioned(
                              bottom: 10.h,
                              child: ButtonSave(
                                onTap: () {
                                  if (cubit.currentIndex < 4) {
                                    cubit.currentIndex++;
                                    DefaultTabController.of(context)
                                        .animateTo(cubit.currentIndex);
                                    cubit.changeCurrentIndex();
                                  }
                                },
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
