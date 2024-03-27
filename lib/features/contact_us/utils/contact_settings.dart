part of '../form.dart';

class _ContactSettings extends StatelessWidget {
  const _ContactSettings({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Contact Us Email
        Container(
          decoration: BoxDecoration(
            color: ColorManager.blackTextColor,
            borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                SvgPicture.asset(
                  IconManager.audio,
                  color: ColorManager.whiteTextColor,
                  width: 25.w,
                  height: 25.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  children: [
                    Text(
                      Strings.contactUs.tr(),
                      style: AppTextStyle.h3.copyWith(
                        color: ColorManager.whiteTextColor,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "+966 123 456",
                      style: AppTextStyle.h4Grey,
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        // Contact Us Phone
        Container(
          decoration: BoxDecoration(
            color: ColorManager.blackTextColor,
            borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                SizedBox(width: 10.w,),
                SvgPicture.asset(
                  IconManager.email,
                  color: ColorManager.whiteTextColor,
                  width: 25.w,
                  height: 25.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  children: [
                    Text(
                      Strings.email.tr(),
                      style: AppTextStyle.h3.copyWith(
                        color: ColorManager.whiteTextColor,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "contactus@rayik.com",
                      style: AppTextStyle.h4Grey,
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ],

    );
  }
}
