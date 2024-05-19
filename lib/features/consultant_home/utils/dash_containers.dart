part of '../form.dart';

class _DashContainers extends StatelessWidget {
  const _DashContainers({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: .2.sh,
      width: 1.sw,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Container(
                height: .2.sh,
                width: .45.sw,
                decoration: BoxDecoration(
                  color: HexColor('#FF5876'),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            Strings.totalEarnings.tr(),
                            style: AppTextStyle.h3.copyWith(
                              color: ColorManager.whiteTextColor
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '\$ 1,000',
                            style: AppTextStyle.h5.copyWith(
                                color: ColorManager.whiteTextColor
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10.h,
                child: SvgPicture.asset(
                  IconManager.lineCR,
                  width: .45.sw,
                  height: .045.sh,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 4.w,
          ),
          Stack(
            children: [
              Container(
                height: .2.sh,
                width: .45.sw,
                decoration: BoxDecoration(
                  color: HexColor('#14098B'),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              Strings.totalAppointments.tr(),
                              style: AppTextStyle.h3.copyWith(
                                color: ColorManager.whiteTextColor
                              )
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '35 ${ Strings.appointments.tr()}',
                            style: AppTextStyle.h5.copyWith(
                                color: ColorManager.whiteTextColor
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10.h,
                child: SvgPicture.asset(
                  IconManager.lineCL,
                  width: .45.sw,
                  height: .045.sh,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
