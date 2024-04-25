part of '../form.dart';

class _ProfileForm extends StatefulWidget {
  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<_ProfileForm> {
  final _formKey = GlobalKey<FormState>();

  String _country = '';
  String _flagC = 'KW';
  String _code = '+965';

  static List<String> arabicGenders = <String>[
    'ذكر',
    'أنثى',
  ];
  static List<String> englishGenders = <String>['Male', "Female"];

  /// Default.

  @override
  Widget build(BuildContext context) {
    String selectedGender = context.locale == const Locale('ar')
        ? arabicGenders.first
        : englishGenders.first;
    ThemeState themeState = context.watch<ThemeCubit>().state;

    //final countryPicker = const FlCountryCodePicker();

    /// Wif custom params.
    final countryPickerWifParams = FlCountryCodePicker(
      localize: true,
      showDialCode: true,
      showSearchBar: false,
      // favoritesIcon: _yourIcon,
      // favorites: _yourFavorites,
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

    return Padding(
      padding: EdgeInsets.all(Dimensions.defaultPadding),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: _containerDecoration(context),
              child: Center(
                child: CustomTextField(
                  heightOfTextField: 46.h,
                  hintText: Strings.firstName.tr(),
                  hasPrefix: false,
                  controller: TextEditingController(text: "دعاء"),
                  borderColor: Colors.transparent,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              decoration: _containerDecoration(context),
              child: Center(
                child: CustomTextField(
                  heightOfTextField: 46.h,
                  hintText: Strings.lastName.tr(),
                  hasPrefix: false,
                  controller: TextEditingController(text: "محمد"),
                  borderColor: Colors.transparent,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              decoration: _containerDecoration(context),
              child: Center(
                child: CustomTextField(
                  heightOfTextField: 46.h,
                  hintText: Strings.email.tr(),
                  hasPrefix: false,
                  controller:
                      TextEditingController(text: "doaareyad20@gmailcom"),
                  borderColor: Colors.transparent,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    // Show the phone code picker when tapped.
                    final picked = await countryPickerWifParams.showPicker(
                      context: context,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                    );
                    // Null check
                    if (picked != null) {
                      setState(() {
                        _code = picked.dialCode;
                      });
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Text(
                      _code,
                      style: AppTextStyle.h3,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: _containerDecoration(context),
                    child: Center(
                      child: CustomTextField(
                        heightOfTextField: 46.h,
                        hintText: Strings.phoneNumber.tr(),
                        hasPrefix: false,
                        readonly: false,
                        keyboardType: TextInputType.phone,
                        borderColor: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    // Show the country code picker when tapped.
                    final picked = await countryPickerWifParams.showPicker(
                      context: context,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                    );
                    // Null check
                    if (picked != null) {
                      setState(() {
                        _country = picked.name;
                        _flagC = picked.code;
                      });
                    }
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      child: CountryFlag.fromCountryCode(
                        _flagC,
                        width: 30.w,
                        height: 30.h,
                      )),
                ),
                Expanded(
                  child: Container(
                    decoration: _containerDecoration(context),
                    child: Center(
                      child: CustomTextField(
                        heightOfTextField: 46.h,
                        hintText: Strings.country.tr(),
                        hasPrefix: false,
                        readonly: true,
                        controller: TextEditingController(text: _country),
                        borderColor: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Container(
              decoration: _containerDecoration(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: DropdownButtonFormField<String>(
                  // remove border
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  hint: Text(Strings.sex.tr()),
                  value: selectedGender,

                  items: context.locale == const Locale('ar')
                      ? arabicGenders.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value.tr(),
                            child: Text(value.tr()),
                          );
                        }).toList()
                      : englishGenders.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value.tr(),
                            child: Row(
                              children: [
                                SizedBox(width: 10.w),
                                Text(value.tr()),
                                SizedBox(width: 10.w),
                              ],
                            ),
                          );
                        }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value!;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

BoxDecoration _containerDecoration(BuildContext context) {
  ThemeState themeState = context.watch<ThemeCubit>().state;
  return BoxDecoration(
    color: themeState == ThemeState.light ? Colors.white : Colors.transparent,
    borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 2,
        blurRadius: 1,
        offset: const Offset(0, 1),
      ),
    ],
  );
}
