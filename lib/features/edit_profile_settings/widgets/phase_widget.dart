import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rayik/features/edit_profile_settings/cubit/edit_profile_setting_cubit.dart';

class PhaseWidget extends StatelessWidget {
  const PhaseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileSettingCubit, EditProfileSettingState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = EditProfileSettingCubit.get(context);
        final currentIndex = cubit.currentIndex;
        return Container(
          width: 0.2.sw,
          height: 15.h,
          decoration: BoxDecoration(
            color: currentIndex == 0 ? const Color(0xff1FBAD6) : const Color(0xffECEBEB),
            borderRadius: BorderRadius.circular(10),
          ),
        );
      },
    );
  }
}
