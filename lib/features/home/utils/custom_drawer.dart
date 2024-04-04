part of '../main_screen_form.dart';

class _CustomDrawer extends StatelessWidget {
  final Function? onTap;
  final String? title;
  final String? icon;
  final Color? iconColor;

  const _CustomDrawer({
    Key? key,
    this.onTap,
    this.title,
    this.icon,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(icon ?? '',
                  width: 20.w,
                  height: 20.h,
                  colorFilter: ColorFilter.mode(
                      iconColor ?? Colors.white, BlendMode.srcIn)),
              SizedBox(
                width: 15.w,
              ),
              Text(
                title ?? '',
                style: AppTextStyle.h3.copyWith(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Divider(
              color: HexColor('#C3C1C1'),
              thickness: .5.w,
            ),
          ),
        ],
      ),
    );
  }
}
