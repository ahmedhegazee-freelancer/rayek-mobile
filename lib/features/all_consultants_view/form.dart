import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/bloc/dark_light_bloc/cubit.dart';
import '../../core/constants/color_manager.dart';
import '../../core/constants/dimensions.dart';
import '../../core/constants/hexa_color.dart';
import '../../core/constants/icon_manager.dart';
import '../../core/constants/strings.dart';
import '../../core/router/router.dart';
import '../../core/theme/fonts_style.dart';
import '../../widgets/back_button.dart';
import '../../widgets/consultant_container.dart';
import '../../widgets/custom_text_field.dart';
import '../search_view/form.dart';

part 'utils/search_area.dart';
part 'utils/consultants_list_view.dart';
part 'utils/title.dart';

class AllConsultantsViewForm extends StatelessWidget {
  const AllConsultantsViewForm({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeState themeState = context.read<ThemeCubit>().state;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 132.h,
              backgroundColor: ColorManager.primaryColor,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: 150.h,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    children: [
                      const _Title(),
                      const _SearchArea(),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
                collapseMode: CollapseMode.parallax,
              ),
              pinned: true,
              automaticallyImplyLeading: false,
              actions: [
                Padding(
                  padding: EdgeInsets.only(
                    left: Dimensions.defaultPadding,
                    right: Dimensions.defaultPadding,
                  ),
                  child: CircleAvatar(
                    radius: 15.r,
                    backgroundColor: ColorManager.primaryColor.withOpacity(.45),
                    child: Center(
                      child: Center(
                        child: CustomBackButton(
                          size: 15.sp,
                          color: ColorManager.whiteTextColor,
                          isColored: true,
                          iosOnly: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ];
        },
        body: DefaultTabController(
            length: 4,
            child: Scaffold(
                appBar: TabBar(
                  //controller: tabController,
                  indicatorColor: themeState == ThemeState.light
                      ? ColorManager.blackTextColor
                      : ColorManager.primaryColor,
                  labelColor: themeState == ThemeState.light
                      ? ColorManager.blackTextColor
                      : ColorManager.whiteTextColor,
                  unselectedLabelColor: ColorManager.greyTextColor,
                  tabs: [
                    Tab(
                      text: Strings.viewAll.tr(),
                    ),
                    Tab(
                      text: Strings.sports.tr(),
                    ),
                    Tab(
                      text: Strings.law.tr(),
                    ),
                    Tab(
                      text: Strings.education.tr(),
                    ),
                  ],
                ),
                body:  TabBarView(
                  children: [
                    SizedBox(
                        height: .7.sh,
                        width: 1.sw,
                      child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                               // MagicRouter.navigateTo(const ConsultantForm());
                              },
                              child: Container(
                                height: 175.h,
                                width: 241.w,
                                decoration: BoxDecoration(
                                  color:
                                  themeState == ThemeState.dark
                                      ? ColorManager.darkContainerColor
                                      : ColorManager.whiteTextColor,
                                  borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
                                  boxShadow:
                                  themeState == ThemeState.dark
                                      ? []
                                      :
                                  [
                                    BoxShadow(
                                      color: ColorManager.greyTextColor.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                           // height: isTopConsultant ?? true ? 155.h : 130.h,
                                            width: 90.w,
                                            height: 110.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(Dimensions.buttonRadius),
                                                topRight: Radius.circular(Dimensions.buttonRadius),
                                              ),
                                              // image:  DecorationImage(
                                              //   image: CachedNetworkImageProvider(
                                              //       "https://th.bing.com/th/id/OIP.fFXk1pO4lPpkEKMLKKq2lwHaHa?w=1000&h=1000&rs=1&pid=ImgDetMain"
                                              //   ),
                                              //   fit: BoxFit.fill,
                                              // ),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(Dimensions.buttonRadius),
                                                topRight: Radius.circular(Dimensions.buttonRadius),
                                                bottomRight: Radius.circular(Dimensions.buttonRadius),
                                                bottomLeft: Radius.circular(Dimensions.buttonRadius),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    "https://th.bing.com/th/id/OIP.iAOtSRtw0kiz5p3e5uvztwHaHa?w=800&h=800&rs=1&pid=ImgDetMain",

                                                fit: BoxFit.fill,
                                                placeholder: (context, url) =>
                                                const Center(child: CircularProgressIndicator()),
                                                errorWidget: (context, url, error) => const Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: EdgeInsets.all(Dimensions.defaultPadding),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      width: 160.w,
                                                      child: Text(

                                                        context.locale.toString() == 'ar'
                                                            ? " محمد عبد الله"
                                                            : "Mohamed Abdullah",
                                                        style: AppTextStyle.h1

                                                      ),
                                                    ),
                                                    //SvgPicture.asset(IconManager.heartIcon, width: 20.w, height: 20.h, color: ColorManager.lightGreyColor,)
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 3.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        context.locale.toString() == 'ar'
                                                            ? "متخصص في المحاماه"
                                                            :
                                                        "Specialized in law",

                                                      ),
                                                    ),
                                                    //  Text(Strings.consultantPrice.tr(), style: AppTextStyle.h4Grey,),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 6.h,
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "4.9",
                                                            style: AppTextStyle.h4Black,
                                                          ),
                                                          SizedBox(
                                                            width: 4.w,
                                                          ),
                                                          Icon(
                                                            Icons.star,
                                                            color: HexColor('#FFC107'),
                                                            size: 20.sp,
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 15.w,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            '60',
                                                            style: AppTextStyle.h4Grey,
                                                          ),
                                                          SizedBox(
                                                            width: 4.w,
                                                          ),
                                                          SvgPicture.asset(
                                                            IconManager.chat,
                                                            width: 20.w,
                                                            height: 20.h,
                                                            colorFilter: const ColorFilter.mode(
                                                                ColorManager.lightGreyColor,
                                                                BlendMode.srcIn),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // Description
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          context.locale.toString() == 'ar'
                                                              ? "محامي متخصص في القانون الجنائي والقانون الدولي"
                                                              :
                                                          "A lawyer specialized in criminal law and international law",
                                                          style: AppTextStyle.h4Grey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        // Price
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child:                                     Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: SizedBox(
                                          height: 100.h,
                                          width: 50.w,
                                          child: Column(
                                            children: [
                                              Text(
                                                context.locale.toString() == 'ar'
                                                    ? "بداية من"
                                                    : "Starting from",
                                                style: AppTextStyle.h4Grey,
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Text(
                                                "1000 \$",
                                                style: AppTextStyle.h4Black.copyWith(
                                                  fontSize: 15.sp,),
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Text(
                                                context.locale.toString() == 'ar'
                                                    ? "للساعه"
                                                    : "Per Hour",
                                                style: AppTextStyle.h4Grey,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ),
                    _ConsultantsListView(
                      itemCount: 1,
                    ),
                    _ConsultantsListView(
                      itemCount: 1,
                    ),
                    _ConsultantsListView(
                      itemCount: 1,
                    ),
                  ],
                ))),
      ),
    );
  }
}
