part of '../form.dart';

class ConsultantListView extends StatelessWidget {
  final double? height ;
  final double? width ;

  const ConsultantListView({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? .7.sh,
        width: width ?? 1.sw,
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  // MagicRouter.navigateTo(const ConsultantForm());
                },
                child: const ConsultantContainerV(),
              ),
            );
          },
        ));
  }
}
