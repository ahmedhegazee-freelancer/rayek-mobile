part of'../form.dart';

class _RatingContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
        boxShadow: [
          BoxShadow(
            color: ColorManager.greyTextColor.withOpacity(.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
    );
  }
}
