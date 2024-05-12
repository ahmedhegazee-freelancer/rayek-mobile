
part of'../form.dart';

class _Description extends StatelessWidget {
  final String? description;

  const _Description({
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              Strings.description.tr(),
              style: AppTextStyle.h1,
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                description ?? "",
                style: AppTextStyle.h4Grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
