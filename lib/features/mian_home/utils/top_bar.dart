part of '../form.dart';

class _TopHomeBar extends StatelessWidget {
  final int? index;

  final GlobalKey<ScaffoldState>? scaffoldKey;

  const _TopHomeBar({this.scaffoldKey, this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      height: 180.h,
      width: 1.sw,
      child: Padding(
        padding: EdgeInsets.all(Dimensions.defaultPadding),
        child: Column(
          children: [

            SizedBox(
              height: 60.h,
            ),
            Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        Strings.searchAbout.tr(),
                        style: AppTextStyle.h3.copyWith(
                          color: ColorManager.greyTextColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        Strings.yourConsultant.tr(),
                        style: AppTextStyle.h1,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextField(
                    hintText: Strings.searchHere.tr(),
                    obscure: false,
                    hasPrefix: false,
                    svgIconSuffix: IconManager.searchIcon,
                    readonly: true,
                    onTap: () {
                      MagicRouter.navigateTo(const SearchForm());
                    },
                  )
                ]))
          ],
        ),
      ),
    );
  }
}
