part of '../form.dart';

class ToggleList extends StatelessWidget {
  const ToggleList({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeState themeState = context.watch<ThemeCubit>().state;
    return BlocBuilder<ToggleCubit, ToggleState>(builder: (context, state) {
      switch (state) {
        case ToggleState.pending:
          break;
        case ToggleState.accepted:
          break;
        case ToggleState.cancelled:
          break;
        case ToggleState.completed:
          break;
      }
      return SizedBox(
        width: 100.w,
        child: Row(
          children: [
            SizedBox(
              width: 10.w,
            ),
            ToggleSwitch(
              initialLabelIndex: state.index,
              totalSwitches: 4,
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
              minWidth: 120.w,
              activeFgColor: themeState == ThemeState.dark
                  ? ColorManager.blackTextColor
                  : ColorManager.whiteTextColor,
              inactiveBgColor: ColorManager.greyTextColor.withOpacity(.1),
              inactiveFgColor: ColorManager.greyTextColor,
              radiusStyle: true,
              dividerColor: themeState == ThemeState.dark
                  ? ColorManager.whiteTextColor
                  : ColorManager.blackTextColor,
              dividerMargin: 12.w,
              labels: [
                Strings.pending.tr(),
                Strings.accepted.tr(),
                Strings.cancelled.tr(),
                Strings.completed.tr()
              ],
              onToggle: (index) {
                context.read<ToggleCubit>().toggle(index ?? 0);
              },
            ),
          ],
        ),
      );
    });
  }
}
