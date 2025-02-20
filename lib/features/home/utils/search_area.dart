part of '../form.dart';

class _SearchArea extends StatelessWidget {
  const _SearchArea();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
        child: Column(
            children:[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(Strings.searchAbout.tr(), style: AppTextStyle.h3.copyWith(
                    color: ColorManager.greyTextColor,
                  ),),
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(Strings.yourConsultant.tr(), style: AppTextStyle.h1,),
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


            ]
        )
    );
  }
}
