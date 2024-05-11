part of '../form.dart';

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultPadding,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 65.h,
            ),
            Row(
              children: [
                CircleAvatar(
                    radius: 30.w,
                    child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CachedNetworkImage(
                          imageUrl: 'https://picsum.photos/200',
                          placeholderFadeInDuration:
                              const Duration(milliseconds: 500),
                          placeholder: (context, url) => Shimmer(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.grey.shade300,
                                Colors.grey.shade200,
                                Colors.grey.shade300,
                              ],
                            ),
                            child:  Container(
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ))),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.hello.tr(),
                      style: AppTextStyle.h3,
                    ),
                    Text(
                      'John Doe',
                      style: AppTextStyle.h1
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
