
import 'package:country_flags/country_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/bloc/dark_light_bloc/cubit.dart';
import '../core/constants/strings.dart';
import '../core/theme/fonts_style.dart';

class PhonePicker extends StatelessWidget {
  const PhonePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = context.read<ThemeCubit>().state;
    final countryCodeBloc = BlocProvider.of<PhonePickerBloc>(context);

    final countryPickerWifParams = FlCountryCodePicker(
      localize: true,
      showDialCode: true,
      showSearchBar: false,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(Strings.selectCountry.tr(),
            style: AppTextStyle.h3.copyWith(
              color:
              themeState == ThemeState.light ? Colors.black : Colors.white,
            )),
      ),
      filteredCountries: ['KW', 'SA', 'AE', 'QA', 'OM', 'BH'],
    );

   // state
    final state = context.watch<PhonePickerBloc>().state;
    return GestureDetector(
      onTap: () async {
        // Show the country code picker when tapped.
        final picked = await countryPickerWifParams.showPicker(
          context: context,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        );
        if (picked != null) {
          countryCodeBloc.updateFlagCode(picked.code, picked.dialCode);
          debugPrint('flag picked: ${picked.code}');
        }
        debugPrint('picked: $picked');
      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: CountryFlag.fromCountryCode(
            state is PhonePickerState0 ? state.flagCode! : state is PhonePickerState1 ? state.flagCode! : 'KW',
            width: 30.w,
            height: 30.h,
          )),
    );
  }
}





// Define the PhonePickerBloc state

abstract class PhonePickerState {}


class PhonePickerState0 extends PhonePickerState {
  final String? flagCode;
  final String? dialCode;


  PhonePickerState0(this.flagCode, this.dialCode);
}

class PhonePickerState1 extends PhonePickerState {
  final String? flagCode;
  final String? dialCode;


  PhonePickerState1(this.flagCode, this.dialCode);
}

// Define the Cubit not Bloc
class PhonePickerBloc extends Cubit<PhonePickerState> {
  int index =0;



  PhonePickerBloc() : super(PhonePickerState0('KW', '+965'));
  // get =>


  void updateFlagCode(String flagCode, String dialCode) {
    index = index + 1;
    if (index == index % 2){
      debugPrint('index: $index');
      emit(PhonePickerState0(flagCode, dialCode));
    }else{
      debugPrint('index: $index');
      emit(PhonePickerState1(flagCode, dialCode));
    }
  }
}
