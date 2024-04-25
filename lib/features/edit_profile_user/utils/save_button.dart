part of'../form.dart';
class _ButtonSave extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: .88.sw,
      text: Strings.updateProfile.tr(),
      onTap: () {},
      isGap: true ,
      iconData: const BackIconInButton(),

    );
  }
}
