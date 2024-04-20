part of '../form.dart';

class AppointsListView extends StatelessWidget {
  const AppointsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.defaultPadding),
      child: SizedBox(
        height: 420.h,
        width: 1.sw,
        child: BlocConsumer<ToggleCubit, ToggleState>(
            builder: (context, state) {
              return state.index != 0
                  ? ListView.builder(
                    itemCount: 1,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return const AppointsContainer();
                    },
                  )
                  : Column(
                    children: [
                      const EmptyAppoints(),
                      SizedBox(
                        height: 100.h,
                      ),
                    ],
                  );
            },
            listener: (context, s) {}),
      ),
    );
  }
}

