part of'../form.dart';

class _ConsultantImage extends StatelessWidget {
  const _ConsultantImage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomCachedImage(
          imageUrl:
          'https://www.sbusinesslondon.ac.uk/blog/wp-content/uploads/2020/07/Consultant-scaled.jpg',
        ),
        Positioned(
          top: 125.h,
          child: Container(
              height: 26.h,
              width: 70.w,
              decoration: BoxDecoration(
                color: ColorManager.primaryColor,
                borderRadius: BorderRadius.only(
                    bottomRight: context.locale.languageCode == 'ar'
                        ? const Radius.circular(0)
                        : const Radius.circular(8),
                    topRight: context.locale.languageCode == 'ar'
                        ? const Radius.circular(0)
                        : const Radius.circular(8),
                    bottomLeft: context.locale.languageCode == 'ar'
                        ? const Radius.circular(8)
                        : const Radius.circular(0),
                    topLeft: context.locale.languageCode == 'ar'
                        ? const Radius.circular(8)
                        : const Radius.circular(0)),
              ),
              child: Center(
                child: Text(
                  Strings.online.tr(),
                  style: AppTextStyle.h5.copyWith(color: Colors.white),
                ),
              )
          ),
        ),
      ],
    );
  }
}
