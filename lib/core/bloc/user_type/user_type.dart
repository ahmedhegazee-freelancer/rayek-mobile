import 'package:flutter_bloc/flutter_bloc.dart';

import '../../general_utils/general_utils.dart';

enum UserType { user, consultant }

class UserTypeCubit extends Cubit<UserType> {
  UserTypeCubit() : super(UserType.user);

  void selectUser() {
    emit(UserType.user);
    GeneralUtils.userType = UserType.user;
  }

  void selectConsultant() {
    emit(UserType.consultant);
    GeneralUtils.userType = UserType.consultant;
  }
}
