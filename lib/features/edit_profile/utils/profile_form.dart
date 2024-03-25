part of'../form.dart';



class _ProfileForm extends StatefulWidget {
  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<_ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _phoneNumber = '';
  String _gender = '';
  String _city = '';
  String _state = '';
  String _country = '';
  String _flag = '';

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
    showSearchBar: true,
    // favoritesIcon: _yourIcon,
    // favorites: _yourFavorites,
    title: Text('s', style: AppTextStyle.h3),
    // filteredCountries: _yourFilters,
    // countryTextStyle: _yourCountryTextStyle,
    // dialCodeTextStyle: _yourdialCodeTextStyle,
    // searchBarDecoration: _yourInputDecoration,
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
            Container(
              decoration: _containerDecoration(),
              child: Center(
                child: CustomTextField(
                  heightOfTextField: 46.h,

                  hintText: Strings.phoneNumber.tr(),
                  hasPrefix: false,
                  borderColor: Colors.transparent,
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
            Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    // Show the country code picker when tapped.
                    final picked= await countryPicker.showPicker(context: context);
                    // Null check
                    if (picked!= null) {
                      setState(() {
                        _country = picked.name;
                        _flag = "https://www.countryflags.io/${picked.code}/flat/64.png";
                      });
                    }
                  },
                  child: Container(
                    padding: const  EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    margin: const  EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: const  BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Container(
                      height: 30.h,
                      width: 30.w,
                      child: Image.network(_flag),
                    )
                  ),
                ),
                Container(
                  padding: const  EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  margin: const  EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: const  BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: Text('Selected Country: $_country', style: const  TextStyle(color: Colors.white)),
                ),



              ],
            ),



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