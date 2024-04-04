part of '../form.dart';


class ToggleList extends StatelessWidget {
  const ToggleList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToggleCallsCubit, ToggleState>(
        builder: (context, state) {
          String stateName;
          switch (state) {
            case ToggleState.past:
              stateName = Strings.pending.tr();
              break;
            case ToggleState.next:
              stateName = Strings.accepted.tr();
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
                      animationDuration:  200,
                      curve: Curves.easeInQuad,
                      activeBgColor: const [ColorManager.blackTextColor, ColorManager.blackTextColor, ColorManager.blackTextColor, ColorManager.blackTextColor],
                      minWidth: .4.sw,
                      activeFgColor: ColorManager.whiteTextColor,
                      inactiveBgColor: ColorManager.greyTextColor.withOpacity(.1),
                      inactiveFgColor: ColorManager.blackTextColor,
                      radiusStyle: true,
                      dividerColor: ColorManager.blackTextColor,
                      dividerMargin: 12.w,
                      labels: [Strings.previous.tr(), Strings.next.tr()],
                      onToggle: (index) {
                        context.read<ToggleCallsCubit>().toggle(index??0);
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
        }
    );
  }
}