import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rayik/core/constants/dimensions.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../core/constants/color_manager.dart';
import '../../core/constants/icon_manager.dart';
import '../../core/constants/strings.dart';
import '../../core/theme/fonts_style.dart';
import '../../widgets/back_button.dart';
import 'bloc/select_service.dart';

part 'utils/title.dart';

class BookServiceTitle extends StatelessWidget {
  const BookServiceTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceCubit(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(Dimensions.defaultPadding),
          child: Column(
            children: [
              SizedBox(height: 35.h),
              const _Title(),
              Expanded(
                child: ListView(
                  children: [
                    Row(children: [
                      Text(
                        Strings.selectService.tr(),
                        style: AppTextStyle.h3,
                      ),
                    ]),
                    SizedBox(height: 20.h),
                    BlocConsumer<ServiceCubit, ServiceState>(
                        builder: (context, state) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => context
                                        .read<ServiceCubit>()
                                        .selectAudio(),
                                    child: Container(
                                      height: 70.h,
                                      decoration: BoxDecoration(
                                        color: state is ServiceAudioSelected
                                            ? Colors.black
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.buttonRadius),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            offset: const Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  IconManager.audio,
                                                  height: 20.h,
                                                  width: 20.w,
                                                  colorFilter: ColorFilter.mode(
                                                    state is ServiceAudioSelected
                                                        ? Colors.white
                                                        : Colors.black,
                                                    BlendMode.srcIn,
                                                  ),
                                                ),
                                                SizedBox(width: 5.w),
                                                Text(
                                                  Strings.audioCall.tr(),
                                                  style: AppTextStyle.h4Grey
                                                      .copyWith(
                                                    color: state
                                                            is ServiceAudioSelected
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10.h),
                                            Text(
                                              "KWD 100",
                                              style: AppTextStyle.h3.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  color: state
                                                          is ServiceAudioSelected
                                                      ? Colors.white
                                                      : Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => context
                                        .read<ServiceCubit>()
                                        .selectVideo(),
                                    child: Container(
                                      height: 70.h,
                                      decoration: BoxDecoration(
                                        color: state is ServiceVideoSelected
                                            ? Colors.black
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.buttonRadius),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            offset: const Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  IconManager.video,
                                                  height: 20.h,
                                                  width: 20.w,
                                                  colorFilter: ColorFilter.mode(
                                                    state is ServiceVideoSelected
                                                        ? Colors.white
                                                        : Colors.black,
                                                    BlendMode.srcIn,
                                                  ),
                                                ),
                                                SizedBox(width: 5.w),
                                                Text(
                                                  Strings.videoCall.tr(),
                                                  style: AppTextStyle.h4Grey
                                                      .copyWith(
                                                    color: state
                                                            is ServiceVideoSelected
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10.h),
                                            Text(
                                              "KWD 100",
                                              style: AppTextStyle.h3.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  color: state
                                                          is ServiceVideoSelected
                                                      ? Colors.white
                                                      : Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => context
                                        .read<ServiceCubit>()
                                        .selectChat(),
                                    child: Container(
                                      height: 70.h,
                                      decoration: BoxDecoration(
                                        color: state is ServiceChatSelected
                                            ? Colors.black
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.buttonRadius),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            offset: const Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  IconManager.chat,
                                                  height: 20.h,
                                                  width: 20.w,
                                                  colorFilter: ColorFilter.mode(
                                                    state is ServiceChatSelected
                                                        ? Colors.white
                                                        : Colors.black,
                                                    BlendMode.srcIn,
                                                  ),
                                                ),
                                                SizedBox(width: 5.w),
                                                Text(
                                                  Strings.chat.tr(),
                                                  style: AppTextStyle.h4Grey
                                                      .copyWith(
                                                    color: state
                                                            is ServiceChatSelected
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10.h),
                                            Text(
                                              "KWD 100",
                                              style: AppTextStyle.h3.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  color: state
                                                          is ServiceChatSelected
                                                      ? Colors.white
                                                      : Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              //
                              SizedBox(height: 20.h),
                              // Date Picker
                              if (state is ServiceAudioSelected ||
                                  state is ServiceVideoSelected ||
                                  state is ServiceChatSelected ||
                                  state is ServiceDateSelected)
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Container(
                                    height: 220.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.buttonRadius),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: const Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                    child: SfDateRangePicker(
                                      // header color
                                      headerHeight: 50.h,

                                      backgroundColor: Colors.white,
                                      //  view: DateRangePickerView.month,
                                      monthViewSettings:
                                          const DateRangePickerMonthViewSettings(
                                              dayFormat: 'EEE',
                                              firstDayOfWeek: 6,
                                              viewHeaderStyle:
                                                  DateRangePickerViewHeaderStyle(
                                                backgroundColor: Colors.white,
                                              )),
                                      //  selectionMode:
                                      //      DateRangePickerSelectionMode.single,
                                      monthCellStyle:
                                          DateRangePickerMonthCellStyle(
                                        textStyle: AppTextStyle.h3,
                                      ),

                                      headerStyle: DateRangePickerHeaderStyle(
                                        textStyle: AppTextStyle.h1,
                                      ),
                                      minDate: DateTime.now(),
                                      maxDate: DateTime.now().add(
                                        const Duration(days: 365),
                                      ),

                                      selectionRadius: 30.0.r,
                                      selectionTextStyle:
                                          AppTextStyle.h3.copyWith(
                                        color: Colors.white,
                                      ),
                                      selectionColor: ColorManager.primaryColor,
                                      onSelectionChanged:
                                          (DateRangePickerSelectionChangedArgs
                                              args) {
                                        context
                                            .read<ServiceCubit>()
                                            .selectDate(args.value);
                                        debugPrint(args.value.toString());
                                      },
                                    ),

                                    // disabledDates: (DateTime date) {
                                  ),
                                ),




                            ],
                          );
                        },
                        listener: (context, state) {})
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

