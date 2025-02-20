part of '../form.dart';

class _ContactSettings extends StatelessWidget {
  final String? phone;
  final String? email;

  const _ContactSettings({Key? key, this.phone, this.email}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeState themeState = context.watch<ThemeCubit>().state;
    return Column(
      children: [
        // Contact Us Email
        GestureDetector(
          onTap: () {
            _makePhoneCall(phone ?? "+966 123 456");
          },
          child: Container(
            decoration: BoxDecoration(
              color: themeState == ThemeState.dark
                  ? ColorManager.darkContainerColor
                  : ColorManager.blackTextColor,
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
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    width: 20.w,
                    height: 20.h,
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
                        phone ?? "+966 123 456",
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
            _sendEmail(email ?? "");
          },
          child: Container(
            decoration: BoxDecoration(
              color: themeState == ThemeState.dark
                  ? ColorManager.darkContainerColor
                  : ColorManager.blackTextColor,
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
                    IconManager.email,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    width: 15.w,
                    height: 15.h,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            Strings.email.tr(),
                            style: AppTextStyle.h3.copyWith(
                              color: ColorManager.whiteTextColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        email ?? "contactus@rayik.com",
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

// launchUrl
Future<void> launchUrl(Uri launchUri) async {
  if (await canLaunch(launchUri.toString())) {
    await launch(launchUri.toString());
  } else {
    throw 'Could not launch $launchUri';
  }
}