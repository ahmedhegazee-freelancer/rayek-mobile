part of '../form.dart';

class _ConsultantsListView extends StatelessWidget {
  final int? itemCount;
  const _ConsultantsListView({Key? key, this.itemCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: Dimensions.defaultPadding, right: Dimensions.defaultPadding),
      child: SizedBox(
        height: .7.sh,
        width: 1.sw,
        child: GridView.builder(
            itemCount: itemCount??6,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .55,
                crossAxisSpacing: 0.w,
                mainAxisSpacing: 5.h),
            itemBuilder: (context, index) {
              return const ConsultantContainer(
                isTopConsultant: false, // Using the same container for top and normal consultants to make name with h3 text style
              );
            }),
      ),
    );
  }
}
