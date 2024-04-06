part of '../form.dart';


class _CallItem extends StatelessWidget {
  // key
  const _CallItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            context.locale.toString() == 'ar'
                ? 'دعاء رياض'
                : 'Doaa Reyad',
            style: AppTextStyle.h3,
          ),
          subtitle: Text(
            '10:00 AM',
            style: AppTextStyle.subtitleStyle.copyWith(
              color: ColorManager.greyTextColor,
            ),
          ),
          trailing: SvgPicture.asset(
            IconManager.about,
            colorFilter: const ColorFilter.mode(
              ColorManager.primaryColor,
              BlendMode.srcIn,
            ),
            width: 22.w,
          ),
          leading: Container(
            width: 50.w,
            height: 50.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.r),
              child: CachedNetworkImage(
                imageUrl:
                'https://th.bing.com/th/id/R.58f60f6b81ae6d054b6b4910a9771fbf?rik=%2fKjN%2fqPR7wXaUw&pid=ImgRaw&r=0',
                placeholder: (context, url) => Shimmer(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      ColorManager.whiteTextColor,
                      ColorManager.greyTextColor,
                    ],
                  ),
                  child: Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: const BoxDecoration(
                      color: ColorManager.primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) =>
                const Icon(Icons.error),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: context.locale.toString() == 'ar'
                ? 20.0
                : 70.0,
            right: context.locale.toString() == 'ar'
                ? 70.0
                : 20.0,
          ),
          child: const Divider(),
        ),
      ],
    );
  }
}
