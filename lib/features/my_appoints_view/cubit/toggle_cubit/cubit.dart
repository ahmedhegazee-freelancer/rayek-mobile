
import 'package:flutter_bloc/flutter_bloc.dart';

enum ToggleState { pending, accepted, cancelled, completed }

class ToggleCubit extends Cubit<ToggleState> {
  ToggleCubit() : super(ToggleState.pending);

  void toggle(int index) {
    switch (index) {
      case 0:
        emit(ToggleState.pending);
        break;
      case 1:
        emit(ToggleState.accepted);
        break;
      case 2:
        emit(ToggleState.cancelled);
        break;
      case 3:
        emit(ToggleState.completed);
        break;
    }
  }
}