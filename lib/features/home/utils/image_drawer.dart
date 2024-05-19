part of'../form.dart';

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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    MagicRouter.goBack();
                    MagicRouter.navigateTo(const EditProfileForm());
                  },
                  child: Container(
                    // shape circle
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: CachedNetworkImage(
                      imageUrl:

                      image ??
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww',
                      imageBuilder: (context, imageProvider) => Container(
                        width: 55.w,
                        height: 55.h,
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
                        style: AppTextStyle.h3),
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
          Center(
            child: BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    if (state == ThemeState.light) {
                      context.read<ThemeCubit>().toDarkTheme();
                    } else {
                      context.read<ThemeCubit>().toLightTheme();
                    }
                  },
                  icon: SvgPicture.asset(
                    state == ThemeState.light
                        ? IconManager.moon
                        :
                    IconManager.morning,
                    width: 20.w,
                    height: 20.h,
                    color: state == ThemeState.light
                        ? ColorManager.primaryColor
                        : Colors.orange,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}