import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rayik/core/constants/color_manager.dart';
import 'package:rayik/core/theme/fonts_style.dart';
import 'package:rayik/widgets/custom_button.dart';

import '../../../core/bloc/user_type/user_type.dart';
import '../../../core/constants/strings.dart';

class SelectUserType extends StatelessWidget {
  const SelectUserType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserTypeCubit(),
      child: BlocBuilder<UserTypeCubit, UserType>(
        builder: (context, state) {
          return Row(children: [
            CustomButton(
                width: 155.w,
                textStyle: state == UserType.consultant
                    ? AppTextStyle.buttonWhiteStyle
                    : AppTextStyle.buttonBlackStyle,
                borderWidth: 0.w,
                borderColor: state == UserType.consultant
                    ? Colors.transparent
                    : ColorManager.primaryColor,

                onTap: () => context.read<UserTypeCubit>().selectUser(),
                color: state == UserType.user
                    ? ColorManager.blackTextColor
                    : ColorManager.greyButtonColor,
                text: Strings.user.tr()),
            SizedBox(
              width: 16.w,
            ),
            CustomButton(
                width: 155.w,
                borderWidth: 0.w,
                borderColor: state == UserType.consultant
                    ? ColorManager.primaryColor
                    : Colors.transparent,
                textStyle: state == UserType.consultant
                    ? AppTextStyle.buttonBlackStyle
                    : AppTextStyle.buttonWhiteStyle,
                onTap: () => context.read<UserTypeCubit>().selectConsultant(),
                color: state == UserType.consultant
                    ? ColorManager.blackTextColor
                    : ColorManager.greyButtonColor,
                text: Strings.consultant.tr()),
          ]);
        },
      ),
    );
  }
}
