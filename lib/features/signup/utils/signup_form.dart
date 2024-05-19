part of "../form.dart";

class _SignUpDataForm extends StatelessWidget {
  const _SignUpDataForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [

        CustomTextField(
          topText: Strings.firstName.tr(),
          isTopText: true,
          hintText: Strings.firstName.tr(),
          svgPrefix: false,
          obscure: false,
          controller: null,
          textAlign: TextAlign.start,
          keyboardType: TextInputType.emailAddress,
          hasPrefix: false,
        ),
        SizedBox(
          height: 5.h,
        ),
        CustomTextField(
          topText: Strings.lastName.tr(),
          isTopText: true,
          hintText: Strings.lastName.tr(),
          svgPrefix: false,
          obscure: false,
          controller: null,
          textAlign: TextAlign.start,
          keyboardType: TextInputType.emailAddress,
          hasPrefix: false,
        ),
        CustomTextField(
          topText: Strings.email.tr(),
          isTopText: true,
          hintText: Strings.email.tr(),
          svgPrefix: false,
          obscure: false,
          controller: null,
          textAlign: TextAlign.start,
          keyboardType: TextInputType.emailAddress,
          hasPrefix: false,
        ),
        CustomTextField(
          topText: Strings.phoneNumber.tr(),
          isTopText: true,
          hintText: Strings.phoneNumber.tr(),
          svgPrefix: true,
          obscure: false,
          controller: null,
          isPhone: true,
          textAlign: TextAlign.start,
          keyboardType: TextInputType.phone,
          hasPrefix: false,
        ),





        CustomTextField(
          topText: Strings.password.tr(),
          isTopText: true,
          hintText: Strings.password.tr(),
          svgPrefix: false,
          obscure: true,
          controller: null,
          textAlign: TextAlign.start,
          keyboardType: TextInputType.emailAddress,
          hasPrefix: false,
        ),
        SizedBox(
          height: 5.h,
        ),
        CustomTextField(
          topText: Strings.confirmPassword.tr(),
          isTopText: true,
          hintText: Strings.confirmPassword.tr(),
          svgPrefix: false,
          obscure: true,
          controller: null,
          textAlign: TextAlign.start,
          keyboardType: TextInputType.emailAddress,
          hasPrefix: false,
        ),
      ],
    );
  }
}
