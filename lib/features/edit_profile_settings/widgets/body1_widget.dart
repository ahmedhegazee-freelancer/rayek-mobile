import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/bloc/dark_light_bloc/cubit.dart';
import '../../../core/constants/color_manager.dart';
import '../../../core/constants/strings.dart';
import '../../../core/theme/fonts_style.dart';
import '../../../widgets/custom_text_field.dart';
import '../cubit/edit_profile_setting_cubit.dart';
import 'decoration_container.dart';

class BodyOneWidget extends StatefulWidget {
  const BodyOneWidget({super.key});

  @override
  State<BodyOneWidget> createState() => _BodyOneWidgetState();
}

class _BodyOneWidgetState extends State<BodyOneWidget> {
  TextEditingController nameController = TextEditingController(text: "MOHAMED");
  TextEditingController secondNameController =
      TextEditingController(text: "ISMAIL");
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController =
      TextEditingController(text: "01069365874");
  static List<String> arabicGenders = <String>[
    'ذكر',
    'أنثى',
  ];
  static List<String> englishGenders = <String>['Male', "Female"];
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileSettingCubit, EditProfileSettingState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = EditProfileSettingCubit.get(context);
        ThemeState themeState = context.watch<ThemeCubit>().state;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              Text("المعلومات الشخصية", style: AppTextStyle.h3),
              SizedBox(
                height: 16.h,
              ),
              Center(
                child: Container(
                  width: 0.6.sw,
                  height: 120.h,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                decoration: containerDecoration(context),
                child: Center(
                  child: CustomTextField(
                    heightOfTextField: 46.h,
                    hintText: Strings.name.tr(),
                    hasPrefix: false,
                    controller: nameController,
                    borderColor: Colors.transparent,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                decoration: containerDecoration(context),
                child: Center(
                  child: CustomTextField(
                    heightOfTextField: 46.h,
                    hintText: Strings.lastName.tr(),
                    hasPrefix: false,
                    controller: secondNameController,
                    borderColor: Colors.transparent,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                decoration: containerDecoration(context),
                child: Center(
                  child: CustomTextField(
                    heightOfTextField: 46.h,
                    hintText: Strings.email.tr(),
                    hasPrefix: false,
                    controller: emailController,
                    borderColor: Colors.transparent,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                decoration: containerDecoration(context),
                child: Center(
                  child: CustomTextField(
                    heightOfTextField: 46.h,
                    hintText: Strings.phoneNumber.tr(),
                    hasPrefix: false,
                    controller: phoneController,
                    borderColor: Colors.transparent,
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: containerDecoration(context),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: DropdownButtonFormField<String>(
                          // remove border
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          hint: Text(
                            Strings.sex.tr(),
                            style: AppTextStyle.hintTextField
                                .copyWith(color: ColorManager.lightGreyColor),
                          ),
                          // value: selectedGender,

                          items: context.locale == const Locale('ar')
                              ? ["اعزب", "متزوج"].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value.tr(),
                                    child: Text(value.tr()),
                                  );
                                }).toList()
                              : ["اعزب", "متزوج"].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value.tr(),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 10.w),
                                        Text(value.tr()),
                                        SizedBox(width: 10.w),
                                      ],
                                    ),
                                  );
                                }).toList(),
                          onChanged: (value) {
                            // setState(() {
                            //   selectedGender = value!;
                            // });
                          },
                        ),
                      ),
                    ), /*  DropDownItem(
                      onChanged: (e) {},
                      hint: "النوع",
                      options: const ["ذكر", "انثي"],
                    ), */
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                    child: Container(
                      decoration: containerDecoration(context),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: DropdownButtonFormField<String>(
                          // remove border
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          hint: Text(
                            "الديانه",
                            style: AppTextStyle.hintTextField
                                .copyWith(color: ColorManager.lightGreyColor),
                          ),
                          // value: selectedGender,

                          items: ["مسحيى", "مسلم"].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value.tr(),
                              child: Text(value.tr()),
                            );
                          }).toList() /*  context.locale == const Locale('ar')
                              ? ["اعزب", "متزوج"].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value.tr(),
                                    child: Text(value.tr()),
                                  );
                                }).toList()
                              : ["اعزب", "متزوج"].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value.tr(),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 10.w),
                                        Text(value.tr()),
                                        SizedBox(width: 10.w),
                                      ],
                                    ),
                                  );
                                }).toList() */
                          ,
                          onChanged: (value) {
                            // setState(() {
                            //   selectedGender = value!;
                            // });
                          },
                        ),
                      ),
                    ), /* DropDownItem(
                      onChanged: (e) {},
                      hint: "الديانه",
                      options: const ["مسحيى", "مسلم"],
                    ), */
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectDate(context),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        height: 42.h,
                        decoration: containerDecoration(context),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "تاريخ الميلاد",
                                style: AppTextStyle.hintTextField.copyWith(
                                    color: ColorManager.lightGreyColor),
                              ),
                              const Icon(
                                Icons.date_range,
                                color: ColorManager.lightGreyColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ), /* DropDownItem(
                      onChanged: (e) {},
                      hint: "تاريخ الميلاد",
                      options: const [],
                    ), */
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                    child: Container(
                      decoration: containerDecoration(context),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: DropdownButtonFormField<String>(
                          // remove border
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          hint: Text(
                            "الوظيفه",
                            style: AppTextStyle.hintTextField
                                .copyWith(color: ColorManager.lightGreyColor),
                          ),
                          // value: selectedGender,

                          items: ["جيولجيا"].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value.tr(),
                              child: Text(value.tr()),
                            );
                          }).toList() /*  context.locale == const Locale('ar')
                              ? ["اعزب", "متزوج"].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value.tr(),
                                    child: Text(value.tr()),
                                  );
                                }).toList()
                              : ["اعزب", "متزوج"].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value.tr(),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 10.w),
                                        Text(value.tr()),
                                        SizedBox(width: 10.w),
                                      ],
                                    ),
                                  );
                                }).toList() */
                          ,
                          onChanged: (value) {
                            // setState(() {
                            //   selectedGender = value!;
                            // });
                          },
                        ),
                      ),
                    ), /* DropDownItem(
                      onChanged: (e) {},
                      hint: "الوظيفه",
                      options: const ["جيولجيا"],
                    ), */
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: containerDecoration(context),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: DropdownButtonFormField<String>(
                          // remove border
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          hint: Text(
                            Strings.country.tr(),
                            style: AppTextStyle.hintTextField
                                .copyWith(color: ColorManager.lightGreyColor),
                          ),
                          // value: selectedGender,

                          items: [
                            "السعوديه",
                            "مصر",
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value.tr(),
                              child: Text(value.tr()),
                            );
                          }).toList() /*  context.locale == const Locale('ar')
                              ? ["اعزب", "متزوج"].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value.tr(),
                                    child: Text(value.tr()),
                                  );
                                }).toList()
                              : ["اعزب", "متزوج"].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value.tr(),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 10.w),
                                        Text(value.tr()),
                                        SizedBox(width: 10.w),
                                      ],
                                    ),
                                  );
                                }).toList() */
                          ,
                          onChanged: (value) {
                            // setState(() {
                            //   selectedGender = value!;
                            // });
                          },
                        ),
                      ),
                    ), /*  DropDownItem(
                      onChanged: (e) {},
                      hint: "البلد",
                      options: const [
                        "السعوديه",
                        "مصر",
                      ],
                    ) */
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                    child: Container(
                      decoration: containerDecoration(context),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: DropdownButtonFormField<String>(
                          // remove border
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          hint: Text(
                            "الحالة الاجتماعية",
                            style: AppTextStyle.hintTextField
                                .copyWith(color: ColorManager.lightGreyColor),
                          ),
                          // value: selectedGender,

                          items: context.locale == const Locale('ar')
                              ? ["اعزب", "متزوج"].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value.tr(),
                                    child: Text(value.tr()),
                                  );
                                }).toList()
                              : ["اعزب", "متزوج"].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value.tr(),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 10.w),
                                        Text(value.tr()),
                                        SizedBox(width: 10.w),
                                      ],
                                    ),
                                  );
                                }).toList(),
                          onChanged: (value) {
                            // setState(() {
                            //   selectedGender = value!;
                            // });
                          },
                        ),
                      ),
                    ),
                    /*  DropDownItem(
                      onChanged: (e) {},
                      hint: "الحاله",
                      options: const ["اعزب", "متزوج"],
                    ), */
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Container(
                decoration: containerDecoration(context),
                child: Center(
                  child: CustomTextField(
                    heightOfTextField: 46.h,
                    hintText: Strings.city.tr(),
                    hasPrefix: false,
                    controller: emailController,
                    borderColor: Colors.transparent,
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              // ButtonSave(
              //   onTap: () {
              //     if (currentIndex != 4) {
              //       currentIndex++;
              //     }

              //     cubit.changeCurrentIndex(currentIndex);
              //   },
              // )
              // CustomButton(
              //   onTap: () {
              //     if (currentIndex != 4) {
              //       currentIndex++;
              //     }

              //     cubit.changeCurrentIndex(currentIndex);
              //   },
              //   text: "Next",
              // )
            ],
          ),
        );
      },
    );
  }

  // void viewChanged(DateRangePickerViewChangedArgs args) {
  //   final DateTime visibleStartDate = args.visibleDateRange.startDate!;
  //   final DateTime visibleEndDate = args.visibleDateRange.endDate!;
  //   final int totalVisibleDays =
  //       (visibleStartDate.difference(visibleEndDate).inDays);
  //   final DateTime midDate =
  //       visibleStartDate.add(Duration(days: totalVisibleDays ~/ 2));
  //   headerString = DateFormat('MMMM yyyy').format(midDate).toString();
  //   SchedulerBinding.instance.addPostFrameCallback((duration) {
  //     setState(() {});
  //   });
  // }
}
