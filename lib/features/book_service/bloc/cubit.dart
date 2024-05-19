import 'package:bloc/bloc.dart';
import 'package:rayik/features/book_service/bloc/states.dart';

enum Period { morning, afternoon, evening }

class ServiceCubit extends Cubit<ServiceState> {
  // Add a DateTime field to your cubit.
  DateTime? selectedDate;
  Period? selectedPeriod;

  ServiceCubit() : super(ServiceInitial());

  void selectAudio() {
    emit(ServiceAudioSelected());
  }

  void selectVideo() {
    emit(ServiceVideoSelected());
  }

  void selectChat() {
    emit(ServiceChatSelected());
  }

  // Update the method to change the date without emitting a new state.
  void selectDate(DateTime date) {
    selectedDate = date;
  }

  void selectTime(String time) {
    // update enum to string
    if (time == 'morning') {
      selectedPeriod = Period.morning;
      emit(PeriodSelected(selectedPeriod));
    } else if (time == 'afternoon') {
      selectedPeriod = Period.afternoon;
      emit(PeriodSelected(selectedPeriod));
    } else if (time == 'evening') {
      selectedPeriod = Period.evening;
      emit(PeriodSelected(selectedPeriod));
    }
  }

  void selectSlot(String slot) {
    emit(ServiceSlotSelected(slot));
  }
}
