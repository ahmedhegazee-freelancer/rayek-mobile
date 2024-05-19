
import 'package:flutter_bloc/flutter_bloc.dart';

enum ToggleState { past, next}

class ToggleCallsCubit extends Cubit<ToggleState> {
  ToggleCallsCubit() : super(ToggleState.past);

  void toggle(int index) {
    switch (index) {
      case 0:
        emit(ToggleState.past);
        break;
      case 1:
        emit(ToggleState.next);
        break;
    }
  }
}