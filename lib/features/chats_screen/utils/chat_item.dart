part of '../form.dart';


class _ChatItem extends StatelessWidget {
  const _ChatItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            MagicRouter.navigateTo(
              const SingleChatFrom(),
            );
          },
          leading: CircleAvatar(
            radius: 25.r,
            backgroundColor: ColorManager.primaryColor.withOpacity(.2),
            child: Center(
              child: CachedNetworkImage(
                imageUrl:
                'https://www.sbusinesslondon.ac.uk/blog/wp-content/uploads/2020/07/Consultant-scaled.jpg',
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  radius: 25.r,
                  backgroundImage: imageProvider,
                ),
                placeholder: (context, url) => CircleAvatar(
                  radius: 20.r,
                  backgroundColor: ColorManager.primaryColor,
                ),
                errorWidget: (context, url, error) => CircleAvatar(
                    radius: 20.r,
                    backgroundColor: ColorManager.primaryColor,
                    child: const Center(
                      child: Icon(
                        Icons.error,
                        color: ColorManager.whiteTextColor,
                      ),
                    )),
                fit: BoxFit.fill,
              ),
            ),
          ),
          title: Text(
            context.locale.toString() == 'ar' ? 'دعاء رياض' : 'Doaa Reyad',
            style: AppTextStyle.h3,
          ),
          subtitle: Row(
            children: [
              CircleAvatar(
                  radius: 8.sp,
                  backgroundColor: ColorManager.primaryColor,
                  child: Center(
                    child: Text(
                      '1',
                      style: AppTextStyle.subtitleStyle.copyWith(
                          color: ColorManager.whiteTextColor, fontSize: 10.sp),
                    ),
                  )),
              SizedBox(
                width: 5.w,
              ),
              Text(
                context.locale.toString() == 'ar'
                    ? 'رسالة جديدة'
                    : 'New Message',
                style: AppTextStyle.subtitleStyle
                    .copyWith(color: ColorManager.greyTextColor),
              ),
            ],
          ),
          trailing: Text(
            'since 3 days',
            style: AppTextStyle.subtitleStyle
                .copyWith(color: ColorManager.greyTextColor),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: context.locale.toString() == 'ar' ? 10.0 : 70.0,
            right: context.locale.toString() == 'ar' ? 70.0 : 10.0,
          ),
          child: const Divider(
            color: ColorManager.greyTextColor,
            thickness: 0.3,
          ),
        ),
      ],
    );
  }
}