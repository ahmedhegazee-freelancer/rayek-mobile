part of '../form.dart';

Widget _buildServiceContainer(BuildContext context, String serviceType, String iconPath, String textLabel,
    bool isSelected) {
  Color colorFilter = isSelected ? Colors.white : Colors.black;

  return GestureDetector(
    onTap: () {
      switch (serviceType) {
        case 'audio':
          context.read<ServiceCubit>().selectAudio();
          break;
        case 'video':
          context.read<ServiceCubit>().selectVideo();
          break;
        case 'chat':
          context.read<ServiceCubit>().selectChat();
          break;
      }
    },
    child: Container(
      height: 70.h,
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.white,
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
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  iconPath,
                  height: 20.h,
                  width: 20.w,
                  colorFilter:
                  ColorFilter.mode(colorFilter, BlendMode.srcIn),
                ),
                SizedBox(width: 5.w),
                Text(
                  textLabel.tr(),
                  style:
                  AppTextStyle.h4Grey.copyWith(color: colorFilter,),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Text("KWD 100",
              style: AppTextStyle.h3.copyWith(
                fontWeight: FontWeight.w700,
                color: colorFilter,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
