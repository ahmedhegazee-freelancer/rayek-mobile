part of'../form.dart';

class _FilterButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
      child: Row(
        children: [



          Container(
              width: 45.w,
              height: 45.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
                  border: Border.all(color: Colors.grey.withOpacity(0.5), width: 2.w, style: BorderStyle.solid),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SvgPicture.asset(IconManager.filter, width: 20.w, height: 20.h,),
              )),
        ],
      ),
    );
  }
}
