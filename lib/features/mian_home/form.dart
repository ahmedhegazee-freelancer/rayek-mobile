import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rayik/features/home/main_screen_form.dart';

import '../../core/constants/icon_manager.dart';
import '../../core/constants/strings.dart';
import '../../widgets/custom_item_nav.dart';
import 'cubit/cubit.dart';
import 'cubit/events.dart';
import 'cubit/states.dart';

class MainScreenPage extends StatelessWidget {
  const MainScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationBloc navigationBloc =
        BlocProvider.of<NavigationBloc>(context);

    return BlocBuilder<NavigationBloc, NavigationStates>(
        builder: (context, state) {
      return Scaffold(
        body: BlocBuilder<NavigationBloc, NavigationStates>(
          builder: (context, navigationState) {
            Widget? screen;
            if (navigationState is HomePageState) {
              screen = const MainScreenForm();
            } else if (navigationState is ExpertsPageState) {
              screen = const Center(child: Text('Experts Page'));
            } else if (navigationState is ChatPageState) {
              screen = const Center(child: Text('Chat Page'));
            } else if (navigationState is CallPageState) {
              screen = const Center(child: Text('Call Page'));
            } else if (navigationState is SettingsPageState) {
              screen = const Center(child: Text('Settings Page'));
            }
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SlideTransition(
                  position: Tween<Offset>(

                    begin: const Offset(1, 0),

                    end: Offset.zero,
                  ).chain(CurveTween(curve: Curves.easeInQuad)).
                  animate(animation),
                  child: child,
                );
              },
              child: screen,
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navigationBloc.currentIndex,
          onTap: (index) {
            debugPrint('index: ${navigationBloc.currentIndex},');

            switch (index) {
              case 0:
                navigationBloc.add(HomePageClickedEvent());
                break;
              case 1:
                navigationBloc.add(ExpertsPageClickedEvent());
                break;
              case 2:
                navigationBloc.add(ChatPageClickedEvent());
                break;
              case 3:
                navigationBloc.add(CallPageClickedEvent());
                break;
              case 4:
                navigationBloc.add(SettingsPageClickedEvent());
                break;
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: CustomNavBarItem(
                title: Strings.home.tr(),
                icon: IconManager.home,
                isSelected: state is HomePageState ? true : false,
              ),
              label: Strings.home.tr(),
            ),
            BottomNavigationBarItem(
              icon: CustomNavBarItem(
                title: Strings.experts.tr(),
                icon: IconManager.experts,
                isSelected: state is ExpertsPageState ? true : false,
              ),
              label: Strings.experts.tr(),
            ),
            BottomNavigationBarItem(
              icon: CustomNavBarItem(
                title: Strings.chat.tr(),
                icon: IconManager.chatNav,
                isSelected: state is ChatPageState ? true : false,
              ),
              label: Strings.chat.tr(),
            ),
            BottomNavigationBarItem(
              icon: CustomNavBarItem(
                title: Strings.call.tr(),
                icon: IconManager.videoNav,
                isSelected: state is CallPageState ? true : false,
              ),
              label: Strings.call.tr(),
            ),
            BottomNavigationBarItem(
              icon: CustomNavBarItem(
                title: Strings.settings.tr(),
                icon: IconManager.settings,
                isSelected: state is SettingsPageState ? true : false,
              ),
              label: Strings.settings.tr(),

            ),
          ],
        ),
      );
    });
  }
}
