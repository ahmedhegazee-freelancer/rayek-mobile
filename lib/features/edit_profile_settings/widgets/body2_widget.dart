import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/color_manager.dart';
import '../../../widgets/custom_button.dart';
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
              "التعليم",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff232232)),
            ),
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
                  decoration: BoxDecoration(
                    color: const Color(0xff1fbad61a).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/icons/upload_image.svg"),
                      SizedBox(height: 16.h),
                      Text(
                        "Upload your certificate",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            TextFormFieldWidget(
              hintText: "الجامعه",
              borderColor: ColorManager.whiteTextColor,
              activeBorderColor: ColorManager.whiteTextColor,
              controller: universityController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: DropDownItem(
                    onChanged: (e) {},
                    hint: "الدرجه",
                    options: const ["A", "B+", "B", "C", "D", "F"],
                  ),
                ),
                SizedBox(
                  width: 24.w,
                ),
                Expanded(
                  child: DropDownItem(
                    onChanged: (e) {},
                    hint: "القسم",
                    options: const [],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              // mainAxisAlignment: MainAxisAlignment.s,
              children: [
                SizedBox(
                  width: 0.43.sw,
                  child: TextFormFieldWidget(
                    hintText: "السنه",
                    borderColor: ColorManager.whiteTextColor,
                    activeBorderColor: ColorManager.whiteTextColor,
                    suffixIcon: const Icon(
                      Icons.calendar_today,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
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
            Card(
              color: ColorManager.whiteTextColor,
              surfaceTintColor: ColorManager.whiteTextColor,
              elevation: 2,
              child: Column(
                children: [
                  ListTile(
                      title: Text(
                        "الجامعة",
                        style: TextStyle(
                          color: const Color(0xff9C9C9C),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      subtitle: Text(
                        "الحاسبات والمعلومات",
                        style: TextStyle(
                          color: const Color(0xff151628),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
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
                      style: TextStyle(
                        color: const Color(0xff9C9C9C),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    subtitle: Text(
                      "بكاليروس الحاسبات والمعلومات",
                      style: TextStyle(
                        color: const Color(0xff151628),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  ListTile(
                    title: Text(
                      "السنة",
                      style: TextStyle(
                        color: const Color(0xff9C9C9C),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    subtitle: Text(
                      "2024",
                      style: TextStyle(
                        color: const Color(0xff151628),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            ButtonSave(
              onTap: () {
                if (currentIndex != 4) {
                  currentIndex++;
                }

                cubit.changeCurrentIndex(currentIndex);
              },
            )
          ],
        );
      },
    );
  }
}
