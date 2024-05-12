import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/color_manager.dart';
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
              "معلومات الحساب",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff232232)),
            ),
            SizedBox(
              height: 16.h,
            ),
            DropDownItem(
              options: const [
                "البنك الاهلي",
                "البنك المصري",
                "البنك العربي",
                "البنك الاهلي",
              ],
              onChanged: (e) {},
              hint: "البنك ",
            ),
            SizedBox(
              height: 16.h,
            ),
            TextFormFieldWidget(
              hintText: "رقم الحساب",
              borderColor: ColorManager.whiteTextColor,
              activeBorderColor: ColorManager.whiteTextColor,
              controller: universityController,
            ),
            SizedBox(
              height: 16.h,
            ),
            TextFormFieldWidget(
              hintText: "رقم الايبان",
              borderColor: ColorManager.whiteTextColor,
              activeBorderColor: ColorManager.whiteTextColor,
              controller: universityController,
            ),
            SizedBox(height: .15.sh),
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
