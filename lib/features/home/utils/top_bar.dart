part of '../main_screen_form.dart';

class _TopHomeBar extends StatelessWidget {
  const _TopHomeBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Icon(Icons.menu, size: 35.sp,),
          ),
          SvgPicture.asset(
            IconManager.notification,
            width: 22.w,
            height: 22.h,
            color: ColorManager.lightGreyColor,
          )
        ],
      ),
    );
  }
}