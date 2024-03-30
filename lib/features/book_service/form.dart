import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rayik/core/constants/dimensions.dart';
import 'package:rayik/core/constants/hexa_color.dart';
import 'package:rayik/widgets/custom_button.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../core/constants/color_manager.dart';
import '../../core/constants/icon_manager.dart';
import '../../core/constants/strings.dart';
import '../../core/theme/fonts_style.dart';
import '../../widgets/back_button.dart';
import '../consultant_page/form.dart';
import 'bloc/cubit.dart';
import 'bloc/states.dart';

part 'utils/title.dart';
part 'utils/period_time.dart';
part 'utils/services.dart';

class BookServiceTitle extends StatelessWidget {
  const BookServiceTitle({super.key});

  @override
  Widget build(BuildContext context) {
    String day = '';
    String service = '';
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
                                  _buildServiceContainer(context, 'audio', IconManager.audio, Strings.audioCall.tr(), state is ServiceAudioSelected),
                                  _buildServiceContainer(context, 'video', IconManager.video, Strings.videoCall.tr(), state is ServiceVideoSelected),
                                  _buildServiceContainer(context, 'chat', IconManager.chat, Strings.chat.tr(), state is ServiceChatSelected),
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
                                      headerHeight: 40.h,

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
                                        textStyle: AppTextStyle.h3,
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
                                        day = args.value.toString().split(' ')[0];
                                        context
                                            .read<ServiceCubit>()
                                            .selectDate(args.value);
                                        debugPrint(args.value.toString());
                                      },
                                    ),
                                  ),
                                ),

                              SizedBox(height: 20.h),

                              if (state is ServiceAudioSelected ||
                                  state is ServiceVideoSelected ||
                                  state is ServiceChatSelected ) _PeriodTime(title: day, service: service,), // When connect api pass service and day and make the api call form period time
                            ],
                          );
                        },
                        listener: (context, state) {}),
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
