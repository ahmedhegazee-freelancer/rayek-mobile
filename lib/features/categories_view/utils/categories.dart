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
    ] ;
    List<String> categoriesIcon = [
      IconManager.lawyer,
      IconManager.sports,
      IconManager.education,
      IconManager.lawyer,
      IconManager.sports,
      IconManager.education,
      IconManager.lawyer,
      IconManager.sports,
      IconManager.education,
      IconManager.lawyer,
      IconManager.sports,
      IconManager.education,

    ] ;
    return Padding(
      padding: EdgeInsets.all(Dimensions.defaultPadding),
      child: SizedBox(
        height: .5.sh,
        width: 1.sw,
        child: GridView.builder(gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.75,
            crossAxisSpacing: 3.w,
            mainAxisSpacing: 25.h
        ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 12,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                MagicRouter.navigateTo(const ConsultantsView());

              },
              child: Container(
                height: 44.h,
                width: 97.w,
                decoration: BoxDecoration(
                  color:
                  index == 0 ? ColorManager.blackTextColor :
                  Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        categoriesIcon[index],
                        height: 30.h,
                        color: index == 0 ? Colors.white : Colors.black,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            categoriesNames[index],
                            style: AppTextStyle.h4Black.copyWith(
                                color: index == 0 ? Colors.white : Colors.black),
                          ),
                          // num of items
                          Text(
                            "(10) ${Strings.consultant.tr()}",
                            style: AppTextStyle.h6.copyWith(
                                color: index == 0 ? Colors.white : Colors.black),
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
      ),
    );
  }
}