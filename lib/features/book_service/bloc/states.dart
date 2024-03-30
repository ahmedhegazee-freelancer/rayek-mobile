
import 'package:rayik/features/book_service/bloc/cubit.dart';

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

class PeriodSelected extends ServiceState {
  final Period? period;

  PeriodSelected(this.period);
}


class ServiceSlotSelected extends ServiceState {
  final String slot;

  ServiceSlotSelected(this.slot);
}
