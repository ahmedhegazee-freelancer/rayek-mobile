import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/bloc/dark_light_bloc/cubit.dart';
import '../../../core/constants/color_manager.dart';
import '../../../core/theme/fonts_style.dart';
import '../../../core/theme/theme.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';
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
  TextEditingController companyController = TextEditingController(),
      fromController = TextEditingController(),
      toController = TextEditingController();

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
                          "تحميل صورة الملف الشخصي",
                          style: AppTextStyle.subtitleStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              // TextFormFieldWidget(
              //   hintText: " اسم الشركه",
              //   borderColor: ColorManager.whiteTextColor,
              //   activeBorderColor: ColorManager.whiteTextColor,
              //   controller: universityController,
              // ),
              Container(
                decoration: containerDecoration(context),
                child: Center(
                  child: CustomTextField(
                    heightOfTextField: 46.h,
                    hintText: " اسم الشركه",
                    hasPrefix: false,
                    controller: companyController,
                    borderColor: Colors.transparent,
                  ),
                ),
              ),

              SizedBox(height: 20.h),
              Row(
                // mainAxisAlignment: MainAxisAlignment.s,
                children: [
                  Expanded(
                    child: Container(
                      decoration: containerDecoration(context),
                      child: Center(
                        child: CustomTextField(
                          heightOfTextField: 46.h,
                          hintText: "من",
                          hasPrefix: false,
                          controller: fromController,
                          borderColor: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 0.43.sw,
                  //   child: TextFormFieldWidget(
                  //     hintText: "من",
                  //     borderColor: Colors.white,
                  //     activeBorderColor: Colors.white,
                  //     suffixIcon: const Icon(
                  //       Icons.calendar_today,
                  //       color: Colors.grey,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                    child: Container(
                      decoration: containerDecoration(context),
                      child: Center(
                        child: CustomTextField(
                          heightOfTextField: 46.h,
                          hintText: "الي",
                          hasPrefix: false,
                          controller: toController,
                          borderColor: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 0.43.sw,
                  //   child: TextFormFieldWidget(
                  //     hintText: "الي",
                  //     borderColor: Colors.white,
                  //     activeBorderColor: Colors.white,
                  //     suffixIcon: const Icon(
                  //       Icons.calendar_today,
                  //       color: Colors.grey,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 20.h),
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
              SizedBox(height: 20.h),
              Container(
                decoration: containerDecoration(context),
                child: Column(
                  children: [
                    ListTile(
                        title: Text(
                          "اسم الشركة",
                          style: AppTextStyle.h3,
                        ),
                        subtitle: Text(
                          "سيكونس",
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
                    Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            title: Text(
                              "من",
                              style: AppTextStyle.h3,
                            ),
                            subtitle: Text(
                              "21-3-2023",
                              style: AppTextStyle.subtitleStyle,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              "الي",
                              style: AppTextStyle.h3,
                            ),
                            subtitle: Text(
                              "21-6-2024",
                              style: AppTextStyle.subtitleStyle,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
