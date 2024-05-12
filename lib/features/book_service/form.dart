import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rayik/core/bloc/dark_light_bloc/cubit.dart';
import 'package:rayik/core/constants/dimensions.dart';
import 'package:rayik/core/constants/hexa_color.dart';
import 'package:rayik/widgets/custom_button.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../core/constants/color_manager.dart';
import '../../core/constants/icon_manager.dart';
import '../../core/constants/strings.dart';
import '../../core/router/router.dart';
import '../../core/theme/fonts_style.dart';
import '../../widgets/back_button.dart';
import '../consultant_page/form.dart';
import '../consultation_topic/form.dart';
import 'bloc/cubit.dart';
import 'bloc/states.dart';

part 'utils/title.dart';
part 'utils/period_time.dart';
part 'utils/services.dart';

class BookServiceForm extends StatelessWidget {
  const BookServiceForm({super.key});

  @override
  Widget build(BuildContext context) {
    String day = '';
    String service = '';
    ThemeState themeState = context.watch<ThemeCubit>().state;
    return BlocProvider(
      create: (context) => ServiceCubit(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
              left: Dimensions.defaultPadding,
              right: Dimensions.defaultPadding,
              top: Dimensions.defaultPadding),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildServiceContainer(
                                      context,
                                      'audio',
                                      IconManager.audio,
                                      "Audio",
                                      state is ServiceAudioSelected),
                                  _buildServiceContainer(
                                      context,
                                      'video',
                                      IconManager.video,
                                      "Video",
                                      state is ServiceVideoSelected),
                                  _buildServiceContainer(
                                      context,
                                      'chat',
                                      IconManager.chat,
                                      Strings.chat.tr(),
                                      state is ServiceChatSelected),
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
                                    height: 327.h,
                                    decoration: BoxDecoration(
                                      color: themeState == ThemeState.light
                                          ? ColorManager.whiteTextColor
                                          : Colors.transparent,
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
                                    child: const HeaderCustomization(),
                                  ),
                                ),

                              SizedBox(height: 20.h),

                              if (state is ServiceAudioSelected ||
                                  state is ServiceVideoSelected ||
                                  state is ServiceChatSelected)
                                _PeriodTime(
                                  title: day,
                                  service: service,
                                ), // When connect api pass service and day and make the api call form period time
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

class HeaderCustomization extends StatefulWidget {
  const HeaderCustomization({Key? key}) : super(key: key);
  @override
  _HeaderCustomizationState createState() => _HeaderCustomizationState();
}

class _HeaderCustomizationState extends State<HeaderCustomization> {
  final DateRangePickerController _controller = DateRangePickerController();
  final ScrollController _scrollController = ScrollController();
  String headerString = '';

  Map<String, String> monthsInArabic = {
    'January': 'يناير',
    'February': 'فبراير',
    'March': 'مارس',
    'April': 'أبريل',
    'May': 'مايو',
    'June': 'يونيو',
    'July': 'يوليو',
    'August': 'أغسطس',
    'September': 'سبتمبر',
    'October': 'أكتوبر',
    'November': 'نوفمبر',
    'December': 'ديسمبر',
  };

  @override
  Widget build(BuildContext context) {
    Map<String, String> monthsInArabic = {
      'January': 'يناير',
      'February': 'فبراير',
      'March': 'مارس',
      'April': 'أبريل',
      'May': 'مايو',
      'June': 'يونيو',
      'July': 'يوليو',
      'August': 'أغسطس',
      'September': 'سبتمبر',
      'October': 'أكتوبر',
      'November': 'نوفمبر',
      'December': 'ديسمبر',
    };

    final double width = MediaQuery.of(context).size.width;
    final double cellWidth = width / 12;
    ThemeState themeState = context.watch<ThemeCubit>().state;

    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  color: themeState == ThemeState.light
                      ? ColorManager.whiteTextColor
                      : Colors.transparent,
                  height: cellWidth,
                  width: cellWidth * 4.5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Text(
                          context.locale.languageCode == 'ar'
                              ? monthsInArabic[headerString.split(
                                      context.locale.languageCode == 'ar'
                                          ? ' '
                                          : '2')[0]] ??
                                  'Unknown month'
                              : headerString.split(
                                  context.locale.languageCode == 'ar'
                                      ? ' '
                                      : '2')[0],
                          textAlign: TextAlign.center,
                          style: AppTextStyle.h3,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          DateTime.now().year.toString(),
                          textAlign: TextAlign.center,
                          style: AppTextStyle.h3,
                        ),
                      ],
                    ),
                  )),
              const Spacer(),
              Row(
                children: [
                  IconButton(
                    icon: const Center(
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: ColorManager.primaryColor,
                      ),
                    ),
                    color: Colors.white,
                    iconSize: 20,
                    highlightColor: ColorManager.primaryColor.withOpacity(.3),
                    onPressed: () {
                      setState(() {
                        _controller.backward!();
                      });
                    },
                  ),
                  SizedBox(width: 10.w),
                  IconButton(
                    icon: const Center(
                        child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: ColorManager.primaryColor,
                    )),
                    color: Colors.white,
                    highlightColor: ColorManager.primaryColor.withOpacity(.3),
                    onPressed: () {
                      setState(() {
                        _controller.forward!();
                      });
                    },
                  ),
                ],
              )
            ],
          ),
          Card(
            child: Container(

              decoration: BoxDecoration(
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
                  controller: _controller,
                  view: DateRangePickerView.month,

                  headerHeight: 0.h,
                  onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                    final DateTime selectedDate = args.value;
                    final DateTime today = DateTime.now();
                    _scrollDown();
                    debugPrint("Selected Date: $selectedDate");
                    if (selectedDate.isBefore(today)) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Please select a valid date')));
                    } else {
                      context.read<ServiceCubit>().selectDate(selectedDate);
                    }
                  },
                  backgroundColor: themeState == ThemeState.light
                      ? ColorManager.whiteTextColor
                      : ColorManager.darkContainerColor,
                  onViewChanged: viewChanged,
                  minDate: DateTime.now(),
                  monthViewSettings:  DateRangePickerMonthViewSettings(
                      dayFormat: 'EEE',
                      firstDayOfWeek: 6,
                      viewHeaderStyle: DateRangePickerViewHeaderStyle(
                          backgroundColor:
                      themeState == ThemeState.light? ColorManager.whiteTextColor : Colors.transparent
                      )),
                  monthCellStyle: DateRangePickerMonthCellStyle(


                      todayTextStyle: AppTextStyle.h3.copyWith(
                          color: themeState == ThemeState.light
                              ? ColorManager.primaryColor
                              : ColorManager.primaryColor),
                      textStyle: AppTextStyle.h3,

                      cellDecoration:
                           BoxDecoration(



                              color: themeState == ThemeState.light
                                  ? ColorManager.whiteTextColor
                                  : Colors.transparent,

                          ),
                      leadingDatesDecoration:
                          const BoxDecoration(color: ColorManager.primaryColor),
                      trailingDatesDecoration:
                          const BoxDecoration(color: ColorManager.primaryColor))),
            ),
          )
        ],
      ),
    );
  }

  void viewChanged(DateRangePickerViewChangedArgs args) {
    final DateTime visibleStartDate = args.visibleDateRange.startDate!;
    final DateTime visibleEndDate = args.visibleDateRange.endDate!;
    final int totalVisibleDays =
        (visibleStartDate.difference(visibleEndDate).inDays);
    final DateTime midDate =
        visibleStartDate.add(Duration(days: totalVisibleDays ~/ 2));
    headerString = DateFormat('MMMM yyyy').format(midDate).toString();
    SchedulerBinding.instance.addPostFrameCallback((duration) {
      setState(() {});
    });
  }

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }
}
