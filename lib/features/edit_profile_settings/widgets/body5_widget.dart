import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/fonts_style.dart';
import '../../../widgets/custom_text_field.dart';

import '../../../core/constants/color_manager.dart';
import '../../../core/theme/theme.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/drop_down_widget.dart';
import '../../../widgets/text_form_field_widget.dart';
import '../cubit/edit_profile_setting_cubit.dart';
import 'save_button.dart';

class BodyFiveWidget extends StatefulWidget {
  const BodyFiveWidget({super.key});

  @override
  State<BodyFiveWidget> createState() => _BodyFiveWidgetState();
}

class _BodyFiveWidgetState extends State<BodyFiveWidget> {
  TextEditingController bankController = TextEditingController(),
      ibanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileSettingCubit, EditProfileSettingState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = EditProfileSettingCubit.get(context);
        var currentIndex = cubit.currentIndex;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text("معلومات الحساب", style: AppTextStyle.h3),
            SizedBox(
              height: 20.h,
            ),
            Container(
              decoration: containerDecoration(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: DropdownButtonFormField<String>(
                  // remove border
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  hint: Text(
                    "البنك",
                    style: AppTextStyle.hintTextField
                        .copyWith(color: ColorManager.lightGreyColor),
                  ),
                  // value: selectedGender,

                  items: [
                    "البنك الاهلي",
                    "البنك المصري",
                    "البنك العربي",
                    "البنك الاهلي",
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
            ),
            // DropDownItem(
            //   options: const [
            //     "البنك الاهلي",
            //     "البنك المصري",
            //     "البنك العربي",
            //     "البنك الاهلي",
            //   ],
            //   onChanged: (e) {},
            //   hint: "البنك ",
            // ),
            SizedBox(
              height: 20.h,
            ),
            // TextFormFieldWidget(
            //   hintText: "رقم الحساب",
            //   borderColor: ColorManager.whiteTextColor,
            //   activeBorderColor: ColorManager.whiteTextColor,
            //   controller: universityController,
            // ),
            Container(
              decoration: containerDecoration(context),
              child: Center(
                child: CustomTextField(
                  heightOfTextField: 46.h,
                  hintText: "رقم الحساب",
                  hasPrefix: false,
                  controller: bankController,
                  borderColor: Colors.transparent,
                ),
              ),
            ),

            SizedBox(
              height: 20.h,
            ),
            // TextFormFieldWidget(
            //   hintText: "رقم الايبان",
            //   borderColor: ColorManager.whiteTextColor,
            //   activeBorderColor: ColorManager.whiteTextColor,
            //   controller: universityController,
            // ),
            Container(
              decoration: containerDecoration(context),
              child: Center(
                child: CustomTextField(
                  heightOfTextField: 46.h,
                  hintText: "رقم الايبان",
                  hasPrefix: false,
                  controller: ibanController,
                  borderColor: Colors.transparent,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
