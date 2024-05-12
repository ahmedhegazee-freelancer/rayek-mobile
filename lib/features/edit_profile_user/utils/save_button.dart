part of '../form.dart';

class _ButtonSave extends StatelessWidget {
  const _ButtonSave({this.onTap});
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: .88.sw,
      text: Strings.updateProfile.tr(),
      onTap: () {
        onTap?.call();
      },
      isGap: true,
      iconData: const BackIconInButton(),
    );
  }
}
