part of '../form.dart';

class _ConsultantsListView extends StatelessWidget {
  const _ConsultantsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          itemCount: 6,
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
    );
  }
}
