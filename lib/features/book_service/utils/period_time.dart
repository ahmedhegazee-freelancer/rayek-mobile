part of '../form.dart';

class _PeriodTime extends StatefulWidget {
  final String? title;
  final String? service;
  const _PeriodTime({Key? key, this.title, this.service}) : super(key: key);

  @override
  _PeriodTimeState createState() => _PeriodTimeState();
}

class _PeriodTimeState extends State<_PeriodTime> {
  int? selectedSlot;

  @override
  Widget build(BuildContext context) {
    ThemeState themeState = context.watch<ThemeCubit>().state;
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
                      ? SizedBox(
                          height: 70.h,
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
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                        color: selectedSlot == index
                                            ? HexColor('#FFA3A3')
                                                .withOpacity(.7)
                                            : Colors.transparent,
                                        // shape: BoxShape.circle,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text('10:00 AM',
                                              style: AppTextStyle.h3.copyWith(
                                                  color: selectedSlot == index
                                                      ? themeState ==
                                                              ThemeState.light
                                                          ? Colors.white
                                                          : Colors.white
                                                      : themeState ==
                                                              ThemeState.light
                                                          ? Colors.black
                                                          : Colors.white,
                                                  fontSize: 12.sp,
                                                  fontWeight:
                                                      FontWeight.normal)),
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
                          onTap: () {
                            MagicRouter.navigateTo(
                              const ConsultationTopicForm(),
                            );
                          },
                          text: Strings.continueText.tr(),
                          isGap: true,
                          iconData: const BackIconInButton(),
                        )
                      : SizedBox(
                          height: 10.h,
                        ),
                  SizedBox(height: 20.h),
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
    ThemeState themeState = context.watch<ThemeCubit>().state;

    Color colorFilter = isSelected
        ? themeState == ThemeState.light
            ? Colors.white
            : ColorManager.primaryColor
        : themeState == ThemeState.light
            ? Colors.black
            : Colors.white;

    return InkWell(
      onTap: () => context.read<ServiceCubit>().selectTime(periodName),
      child: Container(
        width: 100.w,
        decoration: BoxDecoration(
          color: isSelected ?
          themeState == ThemeState.light ?
          ColorManager.primaryColor : Colors.white
          : themeState == ThemeState.light
              ? Colors.white
              : ColorManager.darkGreyColor,
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
                           ColorFilter.mode(
                              themeState == ThemeState.light
                                  ? Colors.white
                                  : ColorManager.primaryColor,
                               BlendMode.srcIn),
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
