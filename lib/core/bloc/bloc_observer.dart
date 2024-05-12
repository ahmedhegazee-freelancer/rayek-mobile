import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint('Event: ${bloc.runtimeType} $event');
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('Change: ${bloc.runtimeType} $change');
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint(
        'Transition: ${bloc.runtimeType} from ${transition.currentState} to ${transition.nextState} with ${transition.event}');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('Error: ${bloc.runtimeType} $error');
    super.onError(bloc, error, stackTrace);
  }
}