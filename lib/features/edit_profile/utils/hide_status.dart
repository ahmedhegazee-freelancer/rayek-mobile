part of'../form.dart';


class _HideStatus extends StatefulWidget {
  const _HideStatus({
    Key? key,
  }) : super(key: key);

  @override
  _HideStatusState createState() => _HideStatusState();
}

class _HideStatusState extends State<_HideStatus> {
  bool _status = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          Strings.hideStatus.tr(),
          style: AppTextStyle.h3,
        ),
        Directionality(
          textDirection:
          context.locale == const Locale('ar') ? TextDirection.rtl :
          TextDirection.ltr,
          child: FlutterSwitch(
            height: 20.h,
            width: 45.w,
            value: _status,
            onToggle: (value) {
              setState(() {
                _status = value;
              });
            },
            activeColor: ColorManager.primaryColor,
          ),
        ),
      ],
    );
  }
}