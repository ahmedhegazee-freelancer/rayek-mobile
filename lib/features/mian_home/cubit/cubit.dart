import 'package:bloc/bloc.dart';
import 'package:rayik/features/mian_home/cubit/states.dart';

import 'events.dart';

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  int currentIndex = 0;

  NavigationBloc() : super(HomePageState()) {
    on<HomePageClickedEvent>((event, emit) {
      currentIndex = 0;
      emit(HomePageState());
    });
    on<ExpertsPageClickedEvent>((event, emit) {
      currentIndex = 1;
      emit(ExpertsPageState());
    });
    on<ChatPageClickedEvent>((event, emit) {
      currentIndex = 2;
      emit(ChatPageState());
    });
    on<CallPageClickedEvent>((event, emit) {
      currentIndex = 3;
      emit(CallPageState());
    });
    on<SettingsPageClickedEvent>((event, emit) {
      currentIndex = 4;
      emit(SettingsPageState());
    });
  }
}