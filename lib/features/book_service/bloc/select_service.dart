import 'package:bloc/bloc.dart';

abstract class ServiceState {}

class ServiceInitial extends ServiceState {}

class ServiceAudioSelected extends ServiceState {}

class ServiceVideoSelected extends ServiceState {}

class ServiceChatSelected extends ServiceState {}

class ServiceDateSelected extends ServiceState {
  final DateTime date;

  ServiceDateSelected(this.date);
}

class ServiceTimeSelected extends ServiceState {
  final String time;

  ServiceTimeSelected(this.time);
}

class ServiceSlotSelected extends ServiceState {
  final String slot;

  ServiceSlotSelected(this.slot);
}

enum Period { morning, afternoon, evening }
class ServiceCubit extends Cubit<ServiceState> {
  // Add a DateTime field to your cubit.
  DateTime? selectedDate;


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

  }

  void selectSlot(String slot) {
    emit(ServiceSlotSelected(slot));
  }
}