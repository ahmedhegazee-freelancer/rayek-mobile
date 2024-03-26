part of '../form.dart';

class _SearchArea extends StatelessWidget {
  const _SearchArea();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
        child: Column(
            children:[
              SizedBox(
                height: 4.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () {
                  debugPrint('SearchForm');
                  MagicRouter.navigateTo(const SearchForm());
                },
                child: CustomTextField(
                  hintText: Strings.searchHere.tr(),
                  obscure: false,
                  hasPrefix: false,
                  svgIconSuffix: IconManager.searchIcon,
                  readonly: true,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(Strings.chooseCategory.tr(), style: AppTextStyle.h1,),
                ],
              ),


            ]
        )
    );
  }
}
