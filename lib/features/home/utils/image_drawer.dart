part of'../main_screen_form.dart';

class _ImageDrawer extends StatelessWidget {
  final String? image;
  final String? name;
  final String? email;

  const _ImageDrawer({
    Key? key,
    this.image,
    this.name,
    this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30.r,
              backgroundColor: ColorManager.primaryColor.withOpacity(.2),
              //backgroundImage: const AssetImage(ImageManager.profileImage),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    MagicRouter.goBack();
                    MagicRouter.navigateTo(const EditProfileForm());
                  },
                  child: CachedNetworkImage(
                    imageUrl:

                    image ??
                        'https://www.pngkey.com/png/full/114-1149878_setting-user-avatar-in-specific-size-without-breaking.png',
                    imageBuilder: (context, imageProvider) => Container(
                      width: 60.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      name ?? 'Doaa Reyad',
                      style: AppTextStyle.h3.copyWith(
                        color: Colors.white,
                      ),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(email??'email@gmail.com', style: AppTextStyle.h4Grey),
                  ],
                ),
              ],
            )
          ],
        ),
        CircleAvatar(
          radius: 15.r,
          backgroundColor: ColorManager.whiteTextColor.withOpacity(.2),
          child: Center(
            child:  CustomBackButton(
              size: 15.sp,
              color: ColorManager.whiteTextColor,
              isColored: true,
              iosOnly: true,
            ),
          ),
        ),
      ],
    );
  }
}