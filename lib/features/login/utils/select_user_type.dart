import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rayik/core/constants/color_manager.dart';
import 'package:rayik/core/theme/fonts_style.dart';
import 'package:rayik/widgets/custom_button.dart';

import '../../../core/bloc/dark_light_bloc/cubit.dart';
import '../../../core/bloc/user_type/user_type.dart';
import '../../../core/constants/strings.dart';

class SelectUserType extends StatelessWidget {
  const SelectUserType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserTypeCubit, UserType>(
      builder: (context, state) {
        return _buildUserTypeButtons(context, state);
      },
    );
  }

  Row _buildUserTypeButtons(BuildContext context, UserType state) {
    final themeState = context.watch<ThemeCubit>().state;
    return Row(children: [
      _buildUserButton(context, state, themeState),
      SizedBox(
        width: 16.w,
      ),
      _buildConsultantButton(context, state, themeState),
    ]);
  }

  CustomButton _buildUserButton(
      BuildContext context, UserType state, ThemeState themeState) {
    return CustomButton(
      width: 155.w,
      textStyle: state == UserType.user
          ? (themeState == ThemeState.dark
              ? AppTextStyle.buttonWhiteStyle
              : AppTextStyle.buttonBlackStyle)
          : (themeState == ThemeState.dark
              ? AppTextStyle.buttonBlackStyle
              : AppTextStyle.buttonWhiteStyle),
      borderWidth: 0.w,
      borderColor: state == UserType.consultant
          ? Colors.transparent
          : ColorManager.primaryColor,
      onTap: () => context.read<UserTypeCubit>().selectUser(),
      color: state == UserType.user
          ? (themeState == ThemeState.dark
              ? Colors.white
              : ColorManager.blackTextColor)
          : ColorManager.greyButtonColor,
      text: Strings.user.tr(),
    );
  }

  CustomButton _buildConsultantButton(
      BuildContext context, UserType state, ThemeState themeState) {
    return CustomButton(
      width: 155.w,
      borderWidth: 0.w,
      borderColor: state == UserType.consultant
          ? ColorManager.primaryColor
          : Colors.transparent,
      textStyle: state == UserType.consultant
          ? (themeState == ThemeState.dark
              ? AppTextStyle.buttonWhiteStyle
              : AppTextStyle.buttonBlackStyle)
          : (themeState == ThemeState.dark
              ? AppTextStyle.buttonBlackStyle
              : AppTextStyle.buttonWhiteStyle),
      onTap: () => context.read<UserTypeCubit>().selectConsultant(),
      color: state == UserType.consultant
          ? (themeState == ThemeState.dark
              ? Colors.white
              : ColorManager.blackTextColor)
          : ColorManager.greyButtonColor,
      text: Strings.consultant.tr(),
    );
  }
}
