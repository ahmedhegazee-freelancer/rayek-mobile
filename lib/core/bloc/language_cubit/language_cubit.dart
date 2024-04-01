import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/app_constants.dart';
import '../../helper/cache_helper.dart';
import 'language_states.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(InitLanguageState());
  static LanguageCubit get(context) => BlocProvider.of(context);
  bool isEnglish = false;
  bool isArabic = true;

  void isSelected(BuildContext context, bool isEnglishSelected) async{
    isEnglish = isEnglishSelected;
    isArabic = !isEnglishSelected;
    String language = isEnglish ? 'en' : 'ar';
    context.setLocale(Locale(language));
    await CacheHelper.setData(key: AppConstants.language, value: language);
    if(isEnglish) {
      emit(EnglishLanguageState());
    } else {
      emit(ArabicLanguageState());
    }
  }
}