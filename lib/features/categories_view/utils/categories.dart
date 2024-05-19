part of '../form.dart';

class _Categories extends StatelessWidget {
  const _Categories();

  @override
  Widget build(BuildContext context) {
    // List of categories
    List<String> categoriesNames = [
      Strings.law.tr(),
      Strings.sports.tr(),
      Strings.education.tr(),
      Strings.law.tr(),
      Strings.sports.tr(),
      Strings.education.tr(),
      Strings.law.tr(),
      Strings.sports.tr(),
      Strings.education.tr(),
      Strings.law.tr(),
      Strings.sports.tr(),
      Strings.education.tr(),
    ];
    // List<String> categoriesIcon = [
    //   IconManager.lawyer,
    //   IconManager.sports,
    //   IconManager.education,
    //   IconManager.lawyer,
    //   IconManager.sports,
    //   IconManager.education,
    //   IconManager.lawyer,
    //   IconManager.sports,
    //   IconManager.education,
    //   IconManager.lawyer,
    //   IconManager.sports,
    //   IconManager.education,
    // ];
    return BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
      return Expanded(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.75,
              crossAxisSpacing: 15.w,
              mainAxisSpacing: 15.h),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: 8,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                MagicRouter.navigateTo(const ConsultantsView());
              },
              child: Container(
                height: 44.h,
                width: 97.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  border: Border.all(
                    color: ColorManager.blackTextColor.withOpacity(0.3),
                    width: 1,
                  ),
                  color: state == ThemeState.dark
                      ? ColorManager.darkContainerColor
                      : index == 0
                          ? ColorManager.blackTextColor
                          : ColorManager.whiteTextColor,
                  boxShadow: state == ThemeState.dark
                      ? [
                          BoxShadow(
                            color: ColorManager.darkContainerColor
                                .withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ]
                      : [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SvgPicture.asset(
                      //   categoriesIcon[index],
                      //   height: 30.h,
                      //   color: index == 0 ? Colors.white : Colors.black,
                      // ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            categoriesNames[index],
                            style: AppTextStyle.h4Black.copyWith(
                                color: state == ThemeState.dark
                                    ? ColorManager.whiteTextColor
                                    : index == 0
                                        ? Colors.white
                                        : Colors.black,
                                fontSize: 18),
                          ),
                          // num of items
                          Text(
                            "(10) ${Strings.consultant.tr()}",
                            style: AppTextStyle.h6.copyWith(
                                color: state == ThemeState.dark
                                    ? ColorManager.whiteTextColor
                                    : index == 0
                                        ? Colors.white
                                        : Colors.black),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
