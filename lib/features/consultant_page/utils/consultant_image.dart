part of'../form.dart';

class _ConsultantImage extends StatelessWidget {
  const _ConsultantImage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
         CustomCachedImage(
          imageUrl:
          'https://th.bing.com/th/id/R.af5d31745d1d968d0864d43c1d34284d?rik=oqwRj3PWcefAzg&riu=http%3a%2f%2fclassifieds.usatoday.com%2fwp-content%2fuploads%2f2018%2f07%2fsuccessful-consultant-768x512.jpeg&ehk=w0h2cIRtQck9OL2%2fJAEf%2b4rJNx2ad0gHYPgn7KWe0RQ%3d&risl=&pid=ImgRaw&r=0',
        ),
        // Positioned(
        //   top: 125.h,
        //   child: Container(
        //       height: 26.h,
        //       width: 70.w,
        //       decoration: BoxDecoration(
        //         color: ColorManager.primaryColor,
        //         borderRadius: BorderRadius.only(
        //             bottomRight: context.locale.languageCode == 'ar'
        //                 ? const Radius.circular(0)
        //                 : const Radius.circular(8),
        //             topRight: context.locale.languageCode == 'ar'
        //                 ? const Radius.circular(0)
        //                 : const Radius.circular(8),
        //             bottomLeft: context.locale.languageCode == 'ar'
        //                 ? const Radius.circular(8)
        //                 : const Radius.circular(0),
        //             topLeft: context.locale.languageCode == 'ar'
        //                 ? const Radius.circular(8)
        //                 : const Radius.circular(0)),
        //       ),
        //       child: Center(
        //         child: Text(
        //           Strings.online.tr(),
        //           style: AppTextStyle.h5.copyWith(color: Colors.white),
        //         ),
        //       )
        //   ),
        // ),
      ],
    );
  }
}
