part of '../form.dart';


class ToggleList extends StatelessWidget {
  const ToggleList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToggleCubit, ToggleState>(
        builder: (context, state) {
          String stateName;
          switch (state) {
            case ToggleState.pending:
              stateName = Strings.pending.tr();
              break;
            case ToggleState.accepted:
              stateName = Strings.accepted.tr();
              break;
            case ToggleState.cancelled:
              stateName = Strings.cancelled.tr();
              break;
            case ToggleState.completed:
              stateName = Strings.completed.tr();
              break;
          }
          return SizedBox(
            width: 100.w,
            child: Row(
              children: [
                SizedBox(width: 10.w,),
                ToggleSwitch(
                  initialLabelIndex: state.index,
                  totalSwitches: 4,
                  animate: true,
                  animationDuration:  200,
                  curve: Curves.easeInQuad,
                  activeBgColor: const [ColorManager.blackTextColor, ColorManager.blackTextColor, ColorManager.blackTextColor, ColorManager.blackTextColor],
                  minWidth: 120.w,
                  activeFgColor: ColorManager.whiteTextColor,
                  inactiveBgColor: ColorManager.greyTextColor.withOpacity(.1),
                  inactiveFgColor: ColorManager.blackTextColor,
                  radiusStyle: true,
                  dividerColor: ColorManager.blackTextColor,
                  dividerMargin: 12.w,
                  labels: [Strings.pending.tr(), Strings.accepted.tr(), Strings.cancelled.tr(), Strings.completed.tr() ],
                  onToggle: (index) {
                    context.read<ToggleCubit>().toggle(index??0);
                  },
                ),
              ],
            ),
          );
        }
    );
  }
}