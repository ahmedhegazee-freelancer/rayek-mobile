import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'edit_profile_setting_state.dart';

class EditProfileSettingCubit extends Cubit<EditProfileSettingState> {
  EditProfileSettingCubit() : super(EditProfileSettingInitial());
  static EditProfileSettingCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  changeCurrentIndex() {
    // currentIndex = index;
    emit(EditProfileSettingChangeIndex());
  }
}
