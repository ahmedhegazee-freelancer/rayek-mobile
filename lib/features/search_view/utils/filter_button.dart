part of'../form.dart';

class _FilterButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [



        Padding(
          padding: EdgeInsets.only(top: 12.0.h), // To Make the icon in the center and same line with the text field
          child: Container(
              width: 45.w,
              height: 45.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
                  border: Border.all(color: ColorManager.fadeGreyBorderColor, width: 2.w, style: BorderStyle.solid),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(IconManager.filter, width: 15.w, height: 15.h,),
              )),
        ),
      ],
    );
  }
}
