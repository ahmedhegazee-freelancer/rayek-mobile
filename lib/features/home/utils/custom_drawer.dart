part of'../main_screen_form.dart';


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
        children: [
          Row(
            children: [
              SvgPicture.asset(
                icon??'',
                width: 24.w,
                height: 24.h,
                color: iconColor?? Colors.white,
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                title??'',
                style: AppTextStyle.h3.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Divider(
            color: HexColor('#C3C1C1'),
            thickness: 1,
          ),

        ],
      ),
    );
  }
}
