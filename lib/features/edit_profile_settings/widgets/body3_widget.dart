import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/color_manager.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/text_form_field_widget.dart';
import '../cubit/edit_profile_setting_cubit.dart';
import 'save_button.dart';

class BodyThreeWidget extends StatefulWidget {
  const BodyThreeWidget({super.key});

  @override
  State<BodyThreeWidget> createState() => _BodyThreeWidgetState();
}

class _BodyThreeWidgetState extends State<BodyThreeWidget> {
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
            const Text(
              "الخبرة",
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
                        "تحميل صورة الملف الشخصي",
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
              hintText: " اسم الشركه",
              borderColor: ColorManager.whiteTextColor,
              activeBorderColor: ColorManager.whiteTextColor,
              controller: universityController,
            ),
            SizedBox(height: 8.h),
            Row(
              // mainAxisAlignment: MainAxisAlignment.s,
              children: [
                SizedBox(
                  width: 0.43.sw,
                  child: TextFormFieldWidget(
                    hintText: "من",
                    borderColor: Colors.white,
                    activeBorderColor: Colors.white,
                    suffixIcon: const Icon(
                      Icons.calendar_today,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                SizedBox(
                  width: 0.43.sw,
                  child: TextFormFieldWidget(
                    hintText: "الي",
                    borderColor: Colors.white,
                    activeBorderColor: Colors.white,
                    suffixIcon: const Icon(
                      Icons.calendar_today,
                      color: Colors.grey,
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
                text: "+ Add Experience ",
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
                        "اسم الشركة",
                        style: TextStyle(
                          color: const Color(0xff9C9C9C),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      subtitle: Text(
                        "سيكونس",
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
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "من",
                            style: TextStyle(
                              color: const Color(0xff9C9C9C),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          subtitle: Text(
                            "21-3-2023",
                            style: TextStyle(
                              color: const Color(0xff151628),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "الي",
                            style: TextStyle(
                              color: const Color(0xff9C9C9C),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          subtitle: Text(
                            "21-6-2024",
                            style: TextStyle(
                              color: const Color(0xff151628),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
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
