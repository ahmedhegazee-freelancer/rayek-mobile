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
                'https://th.bing.com/th/id/OIP.kUE2yev9qd2Y5zbI0lg4AgAAAA?w=468&h=468&rs=1&pid=ImgDetMain',
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