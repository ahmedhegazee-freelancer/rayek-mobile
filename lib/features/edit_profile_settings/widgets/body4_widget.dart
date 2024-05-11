import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            const Text(
              "المهارات",
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
                "Flutter",
                "Dart",
                "Android",
                "IOS",
                "React Native",
              ],
              onChanged: (e) {},
              hint: "القسم",
            ),
            SizedBox(
              height: 16.h,
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
            SizedBox(height: .3.sh),
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
