import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rayik/features/home/main_screen_form.dart';

import '../../core/constants/color_manager.dart';
import '../../core/constants/dimensions.dart';
import '../../core/constants/icon_manager.dart';
import '../../core/constants/image_manager.dart';
import '../../core/constants/strings.dart';
import '../../widgets/custom_item_nav.dart';
import '../categories_view/form.dart';
import 'cubit/cubit.dart';
import 'cubit/events.dart';
import 'cubit/states.dart';

part 'utils/top_bar.dart';

class MainScreenPage extends StatelessWidget {
  const MainScreenPage({super.key});


  @override
  Widget build(BuildContext context) {
    final NavigationBloc navigationBloc =
    BlocProvider.of<NavigationBloc>(context);
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(

        width: 1.sw,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return AnimatedContainer(
              width: constraints.maxWidth,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              decoration:const  BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                image: DecorationImage(
                  image: AssetImage(ImageManager.backDrawer),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(
                    Dimensions.defaultPadding),
                child: const DrawerItems(),
              ),
            );
          },
        ),
      ),
      body: BlocBuilder<NavigationBloc, NavigationStates>(
          builder: (context, state) {
            return Scaffold(
              body: BlocBuilder<NavigationBloc, NavigationStates>(
                builder: (context, navigationState) {
                  Widget? screen;
                  if (navigationState is HomePageState) {
                    screen =  Scaffold(
                      body: Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          _TopHomeBar(scaffoldKey: scaffoldKey),
                          const Expanded(child: MainScreenForm()),
                        ],
                      ),
                    );
                  }else if (navigationState is ExpertsPageState) {
                    screen = const CategoriesView();
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
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: CustomNavBarItem(
                      title: Strings.categories.tr(),
                      icon: IconManager.categories,
                      isSelected: state is ExpertsPageState ? true : false,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: CustomNavBarItem(
                      title: Strings.chat.tr(),
                      icon: IconManager.chatNav,
                      isSelected: state is ChatPageState ? true : false,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: CustomNavBarItem(
                      title: Strings.call.tr(),
                      icon: IconManager.videoNav,
                      isSelected: state is CallPageState ? true : false,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: CustomNavBarItem(
                      title: Strings.settings.tr(),
                      icon: IconManager.settings,
                      isSelected: state is SettingsPageState ? true : false,
                    ),
                    label: '',
                  ),
                ],
              ),
            );
          }),
    );
  }
}