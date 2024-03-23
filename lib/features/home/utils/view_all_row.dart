part of '../main_screen_form.dart';

class _ViewAllRow extends StatelessWidget {
  final String? title;
  final Widget? route;
  const _ViewAllRow({Key? key, this.title, this.route}) : super(key: key);
  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title ?? Strings.viewAll.tr(),
            style: AppTextStyle.h1,
          ),
          GestureDetector(
              onTap: () {
                route == null
                    ? debugPrint("No Route Was Given")
                    : MagicRouter.navigateTo(route!);
              },
              child: Text(
                Strings.viewAll.tr(),
                style: AppTextStyle.underlineTextStyle,
              )),
        ],
      ),
    );
  }
}
