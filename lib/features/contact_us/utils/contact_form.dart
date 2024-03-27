part of '../form.dart';


class _ContactForm extends StatelessWidget {
  const _ContactForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: _containerDecoration(),
          child: Center(
            child: CustomTextField(
              heightOfTextField: 46.h,

              hintText: Strings.email.tr(),
              hasPrefix: false,
              borderColor: Colors.transparent,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          decoration: _containerDecoration(),
          child: Center(
            child: CustomTextField(
              heightOfTextField: 46.h,

              hintText: Strings.subject.tr(),
              hasPrefix: false,
              borderColor: Colors.transparent,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          decoration: _containerDecoration(),
          child: Center(
            child: CustomTextField(
              heightOfTextField: 80.h,

              hintText: Strings.message.tr(),
              hasPrefix: false,
              borderColor: Colors.transparent,
              maxLines: 5,

            ),
          ),
        ),
      ],
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