part of '../form.dart';


class _SearchArea extends StatelessWidget {
  const _SearchArea();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.whiteTextColor,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
          child: Column(
              children:[
                SizedBox(
                  height: 4.h,
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
                ),
                SizedBox(
                  height: 10.h,
                ),
                // Chips Choice

              ]
          )
      ),
    );
  }
}