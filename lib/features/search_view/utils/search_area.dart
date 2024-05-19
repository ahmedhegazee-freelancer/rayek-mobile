part of'../form.dart';

class _TitleArea extends StatelessWidget {
  const _TitleArea();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
        child: Column(
            children:[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(Strings.searchAbout.tr(), style: AppTextStyle.h4Grey,),
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



            ]
        )
    );
  }
}
