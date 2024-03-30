part of '../form.dart';

class _ConsultantData extends StatelessWidget {
  final String? name;
  final String? rating;
  final String? price;
  final String? image;
  final String? service;

  const _ConsultantData({Key? key, this.name, this.rating, this.price, this.image, this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10.w),
          height: 80.h,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.buttonRadius),


            gradient: const LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xFF63636F),
                Color(0xFF232232),
              ],
              stops: [0.0, 1.0], // 0.0 represents the start and 1.0 represents the end of the gradient
            ),


          ),

          child: Row(
            children: [
              // image
              CircleAvatar(
                radius: 27.r,
                backgroundColor: ColorManager.primaryColor.withOpacity(.2),
                child: Center(
                  child:  CachedNetworkImage(
                    imageUrl: image??'https://www.pngkey.com/png/full/114-1149878_setting-user-avatar-in-specific-size-without-breaking.png',
                    imageBuilder: (context, imageProvider) => Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.fill),
                      ),
                    ),
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),

              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name??'Dr. Ahmed',
                    style: AppTextStyle.h1.copyWith(color: Colors.white,fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        IconManager.star,
                        height: 15.h,
                        width: 15.w,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        rating??'4.5',
                        style: AppTextStyle.h4Grey.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  IconManager.audio,
                  height: 25.h,
                  width: 25.w,
                ),
                SizedBox(width: 10.w),
                Text(
                  service??Strings.audioCall.tr(),
                  style: AppTextStyle.h3,
                ),
              ],
            ),
            Text(
              price??'20\$',
              style: AppTextStyle.h3.copyWith(color: ColorManager.primaryColor),
            ),

          ],

        )
      ],
    );
  }
}
