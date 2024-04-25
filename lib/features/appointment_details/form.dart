import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/color_manager.dart';
import '../../core/constants/dimensions.dart';
import '../../core/constants/strings.dart';
import '../../core/theme/fonts_style.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_button.dart';
import '../consultant_page/form.dart';

part 'utils/title.dart';

class AppointmentDetailsForm extends StatelessWidget {
  const AppointmentDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 145.h,
              backgroundColor: ColorManager.primaryColor,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: 60.h,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      const _MyAppointsTitle() ] )

                ),
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
                    backgroundColor: ColorManager.primaryColor.withOpacity(.45),
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
        body:  Padding(
          padding: EdgeInsets.only(
            top: Dimensions.defaultPadding,
            left: Dimensions.defaultPadding,
            right: Dimensions.defaultPadding,
          ),
          child:
          Stack(
            children: [
              Column(
                children: [

                  Expanded(
                    child: ListView(
                      children: [

                        // Appointment Details
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              Strings.appointmentDetails.tr(),
                              style: AppTextStyle.h1,
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
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
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      _CustomColumn(
                                        title: Strings.date.tr(),
                                        value: '12/12/2024',
                                      ),
                                      _CustomColumn(
                                        title: Strings.time.tr(),
                                        value: '12:00 PM',
                                      ),
                                      _CustomColumn(
                                        title: Strings.price.tr(),
                                        value: '100',
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      _CustomColumn(
                                        title: Strings.service.tr(),
                                        value: Strings.videoCall.tr(),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),

                                ],
                              ),
                            )),

                        // Consultant Details
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              Strings.consultantInfo.tr(),
                              style: AppTextStyle.h1,
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
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
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      _CustomColumn(
                                        title: Strings.name.tr(),
                                        value: context.locale == const Locale('en')
                                            ? 'Dr. Ahmed'
                                            : 'د. أحمد',
                                      ),
                                      _CustomColumn(
                                        title: Strings.sex.tr(),
                                        value: Strings.male.tr(),
                                      ),
                                      _CustomColumn(
                                        title: Strings.nationality.tr(),
                                        value: 'Egyptian',
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      _CustomColumn(
                                        title: Strings.dateOfSubmission.tr(),
                                        value: '12/12/2024',
                                      ),
                                      // Rating
                                      _CustomColumn(
                                        title: Strings.ratings.tr(),
                                        value: '4.5',
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            )),

                        //
                        // Questionnaire
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              Strings.question.tr(),
                              style: AppTextStyle.h1,
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Container(
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
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
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(context.locale == const Locale('en')
                                            ? 'Can you tell me about your symptoms?'
                                            : 'هل يمكنك أن تخبرني عن أعراضك؟'),
                                      ),
                                    ],
                                  ),

                                  // Files Icon and Text
                                  SizedBox(
                                    height: 20.h,
                                  ),



                                ],
                              ),
                            )),
                        SizedBox(
                          height: 80.h,
                        ),



                      ],
                    ),
                  ),
                ],
              ),
              // App Custom Button Add Bottom
              Positioned(
                bottom: 10.h,
                left: 0,
                right: 0,
                child: CustomButton(
                  text: Strings.cancelAppointment.tr(),
                  isGap: true,
                  iconData: const BackIconInButton(),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomColumn extends StatelessWidget {
  final String? title;
  final String? value;

  const _CustomColumn({this.title, this.value, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title ?? '',
          style: AppTextStyle.h4Black,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          value ?? '',
          style: AppTextStyle.h4Grey,
        ),
      ],
    );
  }
}
