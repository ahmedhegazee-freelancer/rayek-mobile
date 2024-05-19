
part of'../form.dart';
class _ConsultantName extends StatelessWidget {
  final String? name;
  final String? specialty;

  const _ConsultantName({
    this.name,
    this.specialty,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name ?? '',
              style: AppTextStyle.h1,
            ),
            SizedBox(width: 5.w),
            Image.asset(
              ImageManager.verify,
              height: 25.h,
              width: 25.w,)
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              specialty ?? '',
              style: AppTextStyle.h4Grey,
            ),
          ],
        ),
      ],
    );
  }
}
