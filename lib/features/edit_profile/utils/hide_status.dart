part of'../form.dart';


class _HideStatus extends StatelessWidget {
  const _HideStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          Strings.hideStatus.tr(),
          style: AppTextStyle.h3,
        ),
        SizedBox(
          height: 10.h,
          width: 50.w,
          child: FlutterSwitch(
            height: 20.h,
            width: 40.w,
            value: true,
            onToggle: (value) {},
            activeColor: ColorManager.primaryColor,
          ),

        ),

      ],
    );
  }
}
