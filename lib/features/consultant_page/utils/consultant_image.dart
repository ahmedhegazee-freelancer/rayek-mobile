part of'../form.dart';

class _ConsultantImage extends StatelessWidget {
  const _ConsultantImage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomCachedImage(
          imageUrl:
          'https://th.bing.com/th/id/OIP.fFXk1pO4lPpkEKMLKKq2lwHaHa?w=1000&h=1000&rs=1&pid=ImgDetMain',
        ),
        Positioned(
          top: 160.h,
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
