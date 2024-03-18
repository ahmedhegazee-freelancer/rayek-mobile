
part of '../form.dart';


class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
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
          SizedBox(
            height: 5.h,
          ),
          CustomTextField(
            topText: Strings.password.tr(),
            isTopText: true,
            hintText: Strings.password.tr(),
            svgPrefix: false,
            obscure: true,
            controller: null,
            textAlign: TextAlign.start,

            suffixIcon: const Icon(
              Icons.remove_red_eye_outlined,
              color: ColorManager.fadeGreyBorderColor,
            ),
            keyboardType: TextInputType.emailAddress,
            hasPrefix: false,
          ),
        ]
    );
  }
}