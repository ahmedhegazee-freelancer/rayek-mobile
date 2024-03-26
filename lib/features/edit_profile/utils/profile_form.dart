part of'../form.dart';



class _ProfileForm extends StatefulWidget {
  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<_ProfileForm> {
  final _formKey = GlobalKey<FormState>();

  String _country = '';
  String _flagC = 'KW';

  static  List<String> arabicGenders = <String>[
    'ذكر',
    'أنثى',
  ];
 static List<String> englishGenders = <String>[
    'Male',
    "Female"
  ];
  /// Default.
  final countryPicker = const  FlCountryCodePicker();

  /// Wif custom params.
  final countryPickerWifParams =  FlCountryCodePicker(
    localize: true,
    showDialCode: true,
    showSearchBar: false,
    // favoritesIcon: _yourIcon,
    // favorites: _yourFavorites,
    title: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        Strings.selectCountry.tr(),
      style: AppTextStyle.h3),
    ),
    filteredCountries: ['KW', 'SA', 'AE', 'QA', 'OM', 'BH'],
  );


  @override
  Widget build(BuildContext context) {
    String selectedGender =
    context.locale == const Locale('ar') ? arabicGenders.first : englishGenders.first;
    return Padding(
      padding: EdgeInsets.all(Dimensions.defaultPadding),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: _containerDecoration(),
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
              decoration: _containerDecoration(),
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
              decoration: _containerDecoration(),
              child: Center(
                child: CustomTextField(
                  heightOfTextField: 46.h,

                  hintText: Strings.email.tr(),
                  hasPrefix: false,
                  controller: TextEditingController(text: "doaareyad20@gmailcom"),
                  borderColor: Colors.transparent,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            // Container(
            //   decoration: _containerDecoration(),
            //   child: Center(
            //     child: CustomTextField(
            //       heightOfTextField: 46.h,
            //
            //       hintText: Strings.phoneNumber.tr(),
            //       hasPrefix: false,
            //       borderColor: Colors.transparent,
            //     ),
            //   ),
            // ),
            // Row(
            //   children: [
            //     GestureDetector(
            //       onTap: () async {
            //         // Show the phone code picker when tapped.
            //         final picked = await countryPicker.showPicker(context: context);
            //         // Null check
            //         if (picked != null) {
            //           setState(() {
            //             _code = picked.dialCode;
            //             _flagP = picked.code;
            //           });
            //         }
            //       },
            //       child: Container(
            //         padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            //         margin: const EdgeInsets.symmetric(horizontal: 8.0),
            //         decoration: const BoxDecoration(
            //             borderRadius: BorderRadius.all(Radius.circular(5.0))),
            //         child: CountryFlag.fromCountryCode(
            //           _flagP,
            //           width: 30.w,
            //           height: 30.h,
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       child: Container(
            //         decoration: _containerDecoration(),
            //         child: Center(
            //           child: CustomTextField(
            //             heightOfTextField: 46.h,
            //             hintText: Strings.phoneNumber.tr(),
            //             hasPrefix: false,
            //             readonly: false,
            //             controller: TextEditingController(text: _code),
            //             borderColor: Colors.transparent,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),

            Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    // Show the country code picker when tapped.
                    final picked= await countryPickerWifParams.showPicker(context: context);
                    // Null check
                    if (picked!= null) {
                      setState(() {
                        _country = picked.name;
                        _flagC = picked.code;
                      });
                    }
                  },
                  child: Container(
                      padding: const  EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      margin: const  EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: const  BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      child: CountryFlag.fromCountryCode(
                        _flagC,
                        width: 30.w,
                        height: 30.h,
                      )
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: _containerDecoration(),
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
              height: 50.h,
              decoration: _containerDecoration(),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: IntlPhoneField(
                    controller: TextEditingController(text: '12345678'),
                    // countries: [Country(code: 'KW', dialCode: '965', name: 'Kuwait', flag: 'KW',maxLength: 8,minLength: 8,nameTranslations: {'ar': 'الكويت', 'en': 'Kuwait'})],
                    decoration: InputDecoration(
                      labelText: Strings.phoneNumber.tr(),
                      border: InputBorder.none,
                    ),
                    initialCountryCode: 'KW',
                    onChanged: (phone) {
                      debugPrint(phone.completeNumber);
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),





            Container(
              decoration: _containerDecoration(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: DropdownButtonFormField<String>(
                  // remove border
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  hint: Text(Strings.sex.tr()),
                  value: selectedGender,

                  items:
                  context.locale == const Locale('ar') ? arabicGenders.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value.tr(),
                      child: Text(value.tr()),
                    );
                  }).toList() : englishGenders.map((String value) {
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


BoxDecoration _containerDecoration() {
  return BoxDecoration(
    color: Colors.white,
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