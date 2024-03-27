part of '../form.dart';

class _ContactSettings extends StatelessWidget {
  final String? phone;
  final String? email;

  const _ContactSettings({Key? key, this.phone, this.email}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Contact Us Email
        GestureDetector(
          onTap: () {
            _makePhoneCall(phone??"+966 123 456");
          },
          child: Container(
            decoration: BoxDecoration(
              color: ColorManager.blackTextColor,
              borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  SvgPicture.asset(
                    IconManager.call,
                    color: ColorManager.whiteTextColor,
                    width: 25.w,
                    height: 25.h,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    children: [
                      Text(
                        Strings.contactUs.tr(),
                        style: AppTextStyle.h3.copyWith(
                          color: ColorManager.whiteTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        phone??
                        "+966 123 456",
                        style: AppTextStyle.h4Grey,
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        // Contact Us Phone
        GestureDetector(
          onTap: () {
            _sendEmail(email??"");
          },
          child: Container(
            decoration: BoxDecoration(
              color: ColorManager.blackTextColor,
              borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: 10.w,),
                  SvgPicture.asset(
                    IconManager.email,
                    color: ColorManager.whiteTextColor,
                    width: 25.w,
                    height: 25.h,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    children: [
                      Text(
                        Strings.email.tr(),
                        style: AppTextStyle.h3.copyWith(
                          color: ColorManager.whiteTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        email??
                        "contactus@rayik.com",
                        style: AppTextStyle.h4Grey,
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ],

    );
  }
}

Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  try {
    await launchUrl(launchUri);
  } catch (e) {
    debugPrint(e.toString());
  }
}

// _sendEmail
Future<void> _sendEmail(String email) async {
  final Uri launchUri = Uri(
    scheme: 'mailto',
    path: email,
  );
  try {
    await launchUrl(launchUri);
  } catch (e) {
    debugPrint(e.toString());
  }
}
