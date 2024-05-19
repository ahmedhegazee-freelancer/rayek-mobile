import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/bloc/dark_light_bloc/cubit.dart';
import '../../../core/constants/color_manager.dart';
import '../../../core/constants/strings.dart';
import '../../../core/theme/fonts_style.dart';
import '../../../core/theme/theme.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/drop_down_widget.dart';
import '../../../widgets/text_form_field_widget.dart';
import '../cubit/edit_profile_setting_cubit.dart';
import 'save_button.dart';

class BodyTwoWidget extends StatefulWidget {
  const BodyTwoWidget({super.key});

  @override
  State<BodyTwoWidget> createState() => _BodyTwoWidgetState();
}

class _BodyTwoWidgetState extends State<BodyTwoWidget> {
  TextEditingController universityController =
      TextEditingController(text: "Mansoura");
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
        var currentIndex = cubit.currentIndex;
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              Text("التعليم", style: AppTextStyle.h3),
              SizedBox(
                height: 16.h,
              ),
              Center(
                child: DottedBorder(
                  dashPattern: const [5, 5],
                  radius: const Radius.circular(24),
                  borderType: BorderType.RRect,
                  child: Container(
                    width: 0.6.sw,
                    height: 120.h,
                    decoration: containerDecoration(context),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/upload_image.svg",
                          height: 24.h,
                          width: 24.w,
                          colorFilter: ColorFilter.mode(
                              context.watch<ThemeCubit>().state ==
                                      ThemeState.light
                                  ? ColorManager.blackTextColor
                                  : ColorManager.primaryColor.withOpacity(.5),
                              BlendMode.srcIn),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "Upload your certificate",
                          style: AppTextStyle.subtitleStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              // TextFormFieldWidget(
              //   hintText: "الجامعه",
              //   borderColor: ColorManager.whiteTextColor,
              //   activeBorderColor: ColorManager.whiteTextColor,
              //   controller: universityController,
              // ),
              Container(
                decoration: containerDecoration(context),
                child: Center(
                  child: CustomTextField(
                    heightOfTextField: 46.h,
                    hintText: "الجامعه",
                    hasPrefix: false,
                    controller: universityController,
                    borderColor: Colors.transparent,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                            "الدرجه",
                            style: AppTextStyle.hintTextField
                                .copyWith(color: ColorManager.lightGreyColor),
                          ),
                          // value: selectedGender,

                          items: const ["A", "B+", "B", "C", "D", "F"]
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value.tr(),
                              child: Text(value.tr()),
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
                      hint: "الدرجه",
                      options: const ["A", "B+", "B", "C", "D", "F"],
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
                            "القسم",
                            style: AppTextStyle.hintTextField
                                .copyWith(color: ColorManager.lightGreyColor),
                          ),
                          // value: selectedGender,

                          items: const ["A", "B+", "B", "C", "D", "F"]
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value.tr(),
                              child: Text(value.tr()),
                            );
                          }).toList(),
                          onChanged: (value) {
                            // setState(() {
                            //   selectedGender = value!;
                            // });
                          },
                        ),
                      ),
                    ), /* DropDownItem(
                      onChanged: (e) {},
                      hint: "القسم",
                      options: const [],
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
                  Expanded(child: Container())
                ],
              ),
              SizedBox(height: 20.h),
              // Row(
              //   // mainAxisAlignment: MainAxisAlignment.s,
              //   children: [
              //     SizedBox(
              //       width: 0.43.sw,
              //       child: TextFormFieldWidget(
              //         hintText: "السنه",
              //         borderColor: ColorManager.whiteTextColor,
              //         activeBorderColor: ColorManager.whiteTextColor,
              //         suffixIcon: const Icon(
              //           Icons.calendar_today,
              //           color: Colors.black,
              //         ),
              //       ),
              //     ),
              //     SizedBox(height: 20.h),
              // Container(
              //   decoration: containerDecoration(context),
              //   child: Center(
              //     child: CustomTextField(
              //       heightOfTextField: 46.h,
              //       hintText: Strings.city.tr(),
              //       hasPrefix: false,
              //       // controller: emailController,
              //       borderColor: Colors.transparent,
              //       suffixIcon: const Icon(
              //           Icons.calendar_today,
              //           color: Colors.black,
              //         ),
              //     ),
              //   ),
              // ),
              //   ],
              // ),
              // SizedBox(height: 8.h),
              Center(
                child: CustomButton(
                  onTap: () {},
                  width: 0.4.sw,
                  height: 47.h,
                  radius: 16,
                  text: "+ Add Education ",
                  fontSize: 12,
                  color: const Color(0xff1FBAD6),
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                decoration: containerDecoration(context),
                child: Column(
                  children: [
                    ListTile(
                        title: Text(
                          "الجامعة",
                          style: AppTextStyle.h3,
                        ),
                        subtitle: Text(
                          "الحاسبات والمعلومات",
                          style: AppTextStyle.subtitleStyle,
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {},
                        )),
                    SizedBox(
                      height: 8.h,
                    ),
                    ListTile(
                      title: Text(
                        "الدرجة",
                        style: AppTextStyle.h3,
                      ),
                      subtitle: Text(
                        "بكاليروس الحاسبات والمعلومات",
                        style: AppTextStyle.subtitleStyle,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    ListTile(
                      title: Text(
                        "السنة",
                        style: AppTextStyle.h3,
                      ),
                      subtitle: Text(
                        "2024",
                        style: AppTextStyle.subtitleStyle,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        );
      },
    );
  }
}
