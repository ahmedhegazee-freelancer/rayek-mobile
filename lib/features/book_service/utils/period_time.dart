part of '../form.dart';

class _PeriodTime extends StatefulWidget {
  final String? title;
  final String? service;
  const _PeriodTime({Key? key, this.title, this.service}) : super(key: key);

  @override
  _PeriodTimeState createState() => _PeriodTimeState();
}

class _PeriodTimeState extends State<_PeriodTime> {
   int?  selectedSlot ;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceCubit(),
      child: Column(
        children: [
          BlocBuilder<ServiceCubit, ServiceState>(
            builder: (context, state) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildPeriodContainer(context, 'morning',
                          IconManager.morning, Strings.morning.tr(), state),
                      _buildPeriodContainer(context, 'afternoon',
                          IconManager.night, Strings.afternoon.tr(), state),
                      _buildPeriodContainer(context, 'evening',
                          IconManager.moon, Strings.evening.tr(), state),
                    ],
                  ),
                  state is PeriodSelected
                      ? Container(
                          height: 70.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            shape: BoxShape.rectangle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 20.h,
                              child: GridView.builder(
                                itemCount: 4,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 1.75,
                                ),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedSlot = index;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: selectedSlot == index
                                            ? HexColor('#FFA3A3').withOpacity(.7)
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.buttonRadius),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text('10:00 AM',
                                              style: AppTextStyle.h3.copyWith(
                                                  color: selectedSlot == index
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w700)),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  selectedSlot != null
                      ? CustomButton(
                          onTap: () {},
                          text: Strings.continueText.tr(),
                          isGap: true,
                          iconData: const BackIconInButton(),
                        )
                      : Container(),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPeriodContainer(BuildContext context, String periodName,
      String iconPath, String textLabel, ServiceState state) {
    bool isSelected = state is PeriodSelected &&
        periodName == state.period.toString().split('.').last;
    Color colorFilter = isSelected ? Colors.white : Colors.black;

    return InkWell(
      onTap: () => context.read<ServiceCubit>().selectTime(periodName),
      child: Container(
        width: 100.w,
        decoration: BoxDecoration(
          color: isSelected ? ColorManager.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.buttonRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isSelected
                  ? SvgPicture.asset(
                      iconPath,
                      height: 30.h,
                      width: 30.w,
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    )
                  : SvgPicture.asset(
                      iconPath,
                      height: 30.h,
                      width: 30.w,
                    ),
              SizedBox(width: 5.w),
              Text(
                textLabel,
                style: AppTextStyle.h4Grey.copyWith(color: colorFilter),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
