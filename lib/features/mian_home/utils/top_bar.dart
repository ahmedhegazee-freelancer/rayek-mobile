part of '../form.dart';

class _TopHomeBar extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const _TopHomeBar({this.scaffoldKey});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              scaffoldKey!.currentState!.openDrawer();
            },
            child: Icon(Icons.menu, size: 25.sp,),
          ),
          SvgPicture.asset(
            IconManager.notification,
            width: 22.w,
            height: 22.h,
            colorFilter: const ColorFilter.mode(
              ColorManager.lightGreyColor,
              BlendMode.srcIn,
            )
          )
        ],
      ),
    );
  }
}