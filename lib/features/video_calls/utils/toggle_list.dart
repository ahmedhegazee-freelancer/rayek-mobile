part of '../form.dart';

class ToggleList extends StatelessWidget {
  const ToggleList({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeState themeState = context.watch<ThemeCubit>().state;
    return BlocBuilder<ToggleCallsCubit, ToggleState>(
        builder: (context, state) {
      switch (state) {
        case ToggleState.past:
          break;
        case ToggleState.next:
          break;
      }
      return SizedBox(
        width: 1.sw,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ToggleSwitch(
                  initialLabelIndex: state.index,
                  totalSwitches: 2,
                  animate: true,
                  animationDuration: 200,
                  curve: Curves.easeInQuad,
                  activeBgColor: themeState == ThemeState.dark
                      ? const [
                          ColorManager.whiteTextColor,
                          ColorManager.whiteTextColor,
                          ColorManager.whiteTextColor,
                          ColorManager.whiteTextColor
                        ]
                      : const [
                          ColorManager.blackTextColor,
                          ColorManager.blackTextColor,
                          ColorManager.blackTextColor,
                          ColorManager.blackTextColor
                        ],
                  minWidth: .4.sw,
                  activeFgColor: themeState == ThemeState.dark
                      ? ColorManager.blackTextColor
                      : ColorManager.whiteTextColor,
                  inactiveBgColor: ColorManager.greyTextColor.withOpacity(.1),
                  inactiveFgColor: themeState == ThemeState.dark
                      ? ColorManager.whiteTextColor.withOpacity(.5)
                      : ColorManager.blackTextColor,
                  radiusStyle: true,
                  dividerColor: ColorManager.blackTextColor,
                  dividerMargin: 12.w,
                  labels: [Strings.previous.tr(), Strings.next.tr()],
                  onToggle: (index) {
                    context.read<ToggleCallsCubit>().toggle(index ?? 0);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      );
    });
  }
}
