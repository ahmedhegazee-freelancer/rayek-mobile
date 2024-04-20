part of '../form.dart';

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
    ThemeState themeState = context.watch<ThemeCubit>().state;
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(icon ?? '',
                    width: 20.w,
                    height: 20.h,
                    colorFilter: ColorFilter.mode(
                        iconColor ?? (themeState == ThemeState.light ? Colors.black : Colors.white),
                        BlendMode.srcIn
                    )
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  title ?? '',
                  style: AppTextStyle.h3.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
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
