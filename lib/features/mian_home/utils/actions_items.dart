part of '../form.dart';

class _ActionItems extends StatelessWidget {


  const _ActionItems({
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: .9.sw,
      height: 60.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              scaffoldKey.currentState!.openDrawer();
            },
            // child: index == 0
            //     ?
            child: CircleAvatar(
              radius: 20.r,
              backgroundColor: Colors.transparent
                  ,
              child: Icon(
                Icons.menu,
                color: ColorManager.primaryColor
                    .withOpacity(.8),
                size: 30.sp,
              ),
            ),
          ),
          Row(
            children: [

              InkWell(
                onTap: () {
                  MagicRouter.navigateTo(const SearchForm());
                },
                child: SvgPicture.asset(
                  IconManager.searchIcon,
                  width: 22.w,
                  height: 22.h,
                  colorFilter: const ColorFilter.mode(
                    ColorManager.whiteTextColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                  left: Dimensions.defaultPadding,
                  right: Dimensions.defaultPadding,
                ),
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: ColorManager.primaryColor
                      .withOpacity(.45),
                  child: Center(
                    child: SvgPicture.asset(
                      IconManager.notification,
                      width: 22.w,
                      height: 22.h,
                      colorFilter: const ColorFilter.mode(
                        ColorManager.whiteTextColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
