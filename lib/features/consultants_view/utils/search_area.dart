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
              CustomTextField(
                hintText: Strings.searchHere.tr(),
                obscure: false,
                hasPrefix: false,
                svgIconSuffix: IconManager.searchIcon,
                readonly: true,
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(Strings.sports.tr(), style: AppTextStyle.h1,),
                ],
              ),


            ]
        )
    );
  }
}
