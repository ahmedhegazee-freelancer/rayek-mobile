import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rayik/core/constants/dimensions.dart';
import 'package:rayik/core/constants/icon_manager.dart';
import 'package:rayik/features/consultant_page/utils/details_container.dart';
import 'package:rayik/widgets/custom_button.dart';
import 'package:rayik/widgets/sliver_page.dart';
import '../../core/constants/color_manager.dart';
import '../../core/constants/strings.dart';
import '../../core/theme/fonts_style.dart';
import '../../widgets/custom_cached_image.dart';

part 'utils/consultant_name.dart';
part 'utils/description.dart';
part 'utils/book_button.dart';
part 'utils/consultant_image.dart';



/// Will Replace with API Data
List<String> icons = [
  IconManager.audio,
  IconManager.video,
  IconManager.chat,
];

List<String> services = [
  Strings.audioCall.tr(),
  Strings.videoCall.tr(),
  Strings.chat.tr(),
];

class ConsultantForm extends StatelessWidget {
  const ConsultantForm({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSliverPage(
      image: const _ConsultantImage(),
      imageHeight: 320.h,
      body: Padding(
          padding: EdgeInsets.all(Dimensions.defaultPadding),
          child: Column(
            children: [
              const _ConsultantName(
                name: "محمد احمد",
                specialty: "متخصص في المحاماه",
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DetailsContainer(
                    icon: IconManager.star,
                    subTitle: Strings.reviews.tr(),
                    title: '4.6',
                  ),
                  DetailsContainer(
                    icon: IconManager.person,
                    subTitle: Strings.consultations.tr(),
                    title: '+10',
                  ),
                  DetailsContainer(
                    icon: IconManager.check,
                    subTitle: Strings.experience.tr(),
                    title: '+3',
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              const _Description(
                description:
                    'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.',
              ),
              SizedBox(height: 20.h),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        Strings.availableServices.tr(),
                        style: AppTextStyle.h1,
                      ),
                    ],
                  ),
                  SizedBox(height: 0.h),
                  SizedBox(
                    height: 70.h,
                    child: GridView.builder(
                      itemCount: 3,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 0.w,
                        mainAxisSpacing: 5.h,
                        childAspectRatio: 3,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 5.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: const Offset(0, 1),
                              ),
                            ],
                            borderRadius:
                                BorderRadius.circular(Dimensions.buttonRadius),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    icons[index],
                                    height: 16.h,
                                    width: 16.w,
                                  ),
                                  SizedBox(width: 1.w),
                                  FittedBox(
                                    child: Text(
                                      services[index],
                                      style: AppTextStyle.h5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),

              /////////////// Button
              SizedBox(height: 20.h),
              const _BookButton(),
            ],
          )),
    );
  }
}

