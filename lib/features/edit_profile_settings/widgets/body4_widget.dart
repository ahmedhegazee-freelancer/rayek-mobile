import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/color_manager.dart';
import '../../../core/theme/fonts_style.dart';
import '../../../core/theme/theme.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/drop_down_widget.dart';
import '../cubit/edit_profile_setting_cubit.dart';
import 'save_button.dart';

class BodyFourWidget extends StatefulWidget {
  const BodyFourWidget({super.key});

  @override
  State<BodyFourWidget> createState() => _BodyFourWidgetState();
}

class _BodyFourWidgetState extends State<BodyFourWidget> {
  TextEditingController universityController = TextEditingController();

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
              height: 16.h,
            ),
            Text("المهارات", style: AppTextStyle.h3),
            SizedBox(
              height: 16.h,
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
                    "Section",
                    style: AppTextStyle.hintTextField
                        .copyWith(color: ColorManager.lightGreyColor),
                  ),
                  // value: selectedGender,

                  items: ["Lawyer", "Lawyer"].map((String value) {
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
            //     "Flutter",
            //     "Dart",
            //     "Android",
            //     "IOS",
            //     "React Native",
            //   ],
            //   onChanged: (e) {},
            //   hint: "القسم",
            // ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: CustomButton(
                onTap: () {},
                width: 0.4.sw,
                height: 47.h,
                radius: 16,
                text: "+ Add Skills ",
                fontSize: 12,
                color: const Color(0xff1FBAD6),
              ),
            ),
          ],
        );
      },
    );
  }
}
