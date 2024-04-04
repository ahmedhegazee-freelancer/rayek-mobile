part of '../form.dart';

class _TopHomeBar extends StatelessWidget {
  final int? index;

  final GlobalKey<ScaffoldState>? scaffoldKey;

  const _TopHomeBar({this.scaffoldKey, this.index});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              index == 0
                  ? scaffoldKey!.currentState!.openDrawer()
                  : MagicRouter.navigateTo(
                      const SearchForm(),
                    );
            },
            child: index == 0
                ? Icon(
                    Icons.menu,
                    color: ColorManager.greyTextColor,
                    size: 25.sp,
                  )
                : CircleAvatar(
                    radius: 20.r,
                    backgroundColor: Colors.transparent,
                    child: Center(
                      child: SvgPicture.asset(
                        IconManager.searchIcon,
                        colorFilter: const ColorFilter.mode(
                          ColorManager.primaryColor,
                          BlendMode.srcIn,
                        ),
                        width: 20.w,
                      ),
                    ),
                  ),
          ),
          SvgPicture.asset(IconManager.notification,
              width: 22.w,
              height: 22.h,
              colorFilter: ColorFilter.mode(
                index == 0
                    ? ColorManager.greyTextColor
                    : ColorManager.primaryColor,
                BlendMode.srcIn,
              ))
        ],
      ),
    );
  }
}
