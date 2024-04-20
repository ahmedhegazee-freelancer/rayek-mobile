part of '../form.dart';

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding:  EdgeInsets.only(left: Dimensions.defaultPadding, right: Dimensions.defaultPadding),
        child: Column(children: [
          SizedBox(height: 20.h),

          SizedBox(
            height: 10.h,
          ),
        ],),
      ),
    );
  }
}
