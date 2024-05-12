part of'../form.dart';


class _ResendCode extends StatelessWidget {
  const _ResendCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Strings.didReceiveCode.tr(),
          style: AppTextStyle.h3,
        ),
        SizedBox(
          width: 5.w,
        ),
        InkWell(
          onTap: () {
            // resend code
          },
          child: Text(
            Strings.resendCode.tr(),
            style: AppTextStyle.subtitleStyle.copyWith(
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}