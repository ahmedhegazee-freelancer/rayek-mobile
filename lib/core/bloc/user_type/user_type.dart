import 'package:flutter_bloc/flutter_bloc.dart';

enum UserType { user, consultant }

class UserTypeCubit extends Cubit<UserType> {
  UserTypeCubit() : super(UserType.user);

  void selectUser() => emit(UserType.user);
  void selectConsultant() => emit(UserType.consultant);
}