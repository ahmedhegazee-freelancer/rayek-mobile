import 'package:country_flags/country_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rayik/core/constants/dimensions.dart';
import 'package:rayik/core/router/router.dart';
import 'package:rayik/features/login/form.dart';

import '../../core/bloc/language_cubit/language_cubit.dart';
import '../../core/bloc/language_cubit/language_states.dart';
import '../../core/constants/color_manager.dart';
import '../../core/constants/strings.dart';
import '../../core/theme/fonts_style.dart';
import '../../widgets/back_button.dart';

part 'utils/title.dart';

class SelectLanguageForm extends StatelessWidget {
  const SelectLanguageForm({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<LanguageCubit, LanguageState>(
      listener: (context, state) {},
      builder: (context, state) => SafeArea(
        child: Scaffold(
          // bottomNavigationBar: Padding(
          //   padding: const EdgeInsets.all(20),
          //   // child: CustomButton(
          //   //   onTap: () {
          //   //     // context.setLocale(const Locale('en'));
          //   //     // Navigator.pushReplacement(
          //   //     //   context,
          //   //     //   MaterialPageRoute(builder: (context) => const TapsScreen()),
          //   //     // );
          //   //   },
          //   //   text: Strings.continueText.tr(),
          //   //   color: ColorManager.blackTextColor,
          //   //   // height: size.height * 0.07,
          //   // ),
          // ),
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  const _Title(),

                  Container(
                    height: 1,
                    width: size.width,
                    color: ColorManager.greyTextColor,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),


                      SizedBox(
                        height: 20.h,),

                      // English Button
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Language Change',
                                  style: AppTextStyle.h1.copyWith(color: Colors.black)),
                                content: Text('The app will restart from the first screen to update the language to English.',
                                  style: AppTextStyle.h3.copyWith(color: Colors.black)),
                                actions: <Widget>[

                                  // Cancel Button
                                  InkWell(
                                    child: Text('Cancel', style: AppTextStyle.h3.copyWith(color: Colors.black)),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),

                                  SizedBox(
                                    width: 30.w,
                                  ),

                                  InkWell(
                                    child: Text('OK', style: AppTextStyle.h3.copyWith(color: ColorManager.primaryColor)),
                                    onTap: () {
                                      MagicRouter.navigateAndPopAll(const LoginView());
                                      context.read<LanguageCubit>().isSelected(context, true);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 40.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
                            color: context.locale == const Locale('en')
                                ? ColorManager.blackTextColor
                                : Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CountryFlag.fromCountryCode(
                                  'US',
                                  height: 30.h,
                                  width: 30.w,
                                  borderRadius: 1,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  'English',
                                  style: AppTextStyle.h3.copyWith(
                                    color: context.locale == const Locale('en')
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  ),
                              ],
                            ),
                          )
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      // Arabic Button
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('تغيير اللغة', style: AppTextStyle.h1.copyWith(color: Colors.black)),
                                content: Text('سيتم إعادة تشغيل التطبيق من الشاشة الأولى لتحديث اللغة إلى العربية.'
                                , style: AppTextStyle.h3.copyWith(color: Colors.black)),
                                actions: <Widget>[

                                  // Cancel Button
                                  InkWell(
                                    child: Text('إلغاء', style: AppTextStyle.h3.copyWith(color: Colors.black)),
                                    onTap: () {
                                      MagicRouter.goBack();
                                    },
                                  ),
                                  SizedBox(
                                    width: 30.w,
                                  ),
                                  InkWell(
                                    child: Text('موافق', style: AppTextStyle.h3.copyWith(color: ColorManager.primaryColor)),
                                    onTap: () {
                                      MagicRouter.navigateAndPopUntilFirstPage(const LoginView());
                                      context.read<LanguageCubit>().isSelected(context, false);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 40.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
                            color: context.locale == const Locale('ar')
                                ? ColorManager.blackTextColor
                                : Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CountryFlag.fromCountryCode(
                                  'KW',
                                  height: 30.h,
                                  width: 30.w,
                                  borderRadius: 3,

                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  'العربية',
                                  style: AppTextStyle.h3.copyWith(
                                    color: context.locale == const Locale('ar')
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),

                  SizedBox(
                    height: size.height * 0.05,
                  ),

                  SizedBox(
                    height: size.height * 0.02,
                  ),

                  // MyDropDownWidget(
                  //   isLanguage: false,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
