import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/color_manager.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/drop_down_widget.dart';
import '../../../widgets/text_form_field_widget.dart';
import '../cubit/edit_profile_setting_cubit.dart';
import 'save_button.dart';

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
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController =
      TextEditingController(text: "01069365874");

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
            const Text(
              "المعلومات الشخصية",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff232232)),
            ),
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
            TextFormFieldWidget(
              hintText: "الاسم",
              borderColor: ColorManager.whiteTextColor,
              activeBorderColor: ColorManager.whiteTextColor,
              controller: nameController,
            ),
            TextFormFieldWidget(
              hintText: "الاسم",
              borderColor: ColorManager.whiteTextColor,
              activeBorderColor: ColorManager.whiteTextColor,
              controller: secondNameController,
            ),
            TextFormFieldWidget(
              hintText: "ادخل الايميل",
              borderColor: ColorManager.whiteTextColor,
              activeBorderColor: ColorManager.whiteTextColor,
              controller: emailController,
            ),
            TextFormFieldWidget(
              hintText: "ادخل رقم الهاتف",
              borderColor: ColorManager.whiteTextColor,
              activeBorderColor: ColorManager.whiteTextColor,
              controller: phoneController,
            ),
            Row(
              children: [
                Expanded(
                  child: DropDownItem(
                    onChanged: (e) {},
                    hint: "النوع",
                    options: const ["ذكر", "انثي"],
                  ),
                ),
                SizedBox(
                  width: 24.w,
                ),
                Expanded(
                  child: DropDownItem(
                    onChanged: (e) {},
                    hint: "الديانه",
                    options: const ["السيد البدوي"],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Expanded(
                  child: DropDownItem(
                    onChanged: (e) {},
                    hint: "تاريخ الميلاد",
                    options: const [],
                  ),
                ),
                SizedBox(
                  width: 24.w,
                ),
                Expanded(
                  child: DropDownItem(
                    onChanged: (e) {},
                    hint: "الوظيفه",
                    options: const ["جيولجيا"],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Expanded(
                  child: DropDownItem(
                    onChanged: (e) {},
                    hint: "البلد",
                    options: const [
                      "السعوديه",
                    ],
                  ),
                ),
                SizedBox(
                  width: 24.w,
                ),
                Expanded(
                  child: DropDownItem(
                    onChanged: (e) {},
                    hint: "الحاله",
                    options: const ["اعزب", "متزوج"],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            TextFormFieldWidget(
              hintText: "المدينه",
              borderColor: ColorManager.whiteTextColor,
              activeBorderColor: ColorManager.whiteTextColor,
              controller: cityController,
            ),
            SizedBox(height: 8.h),
            ButtonSave(
              onTap: () {
                if (currentIndex != 4) {
                  currentIndex++;
                }

                cubit.changeCurrentIndex(currentIndex);
              },
            )
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
        );
      },
    );
  }
}
