import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project/core/constants/app_consts.dart';
import 'package:get_storage/get_storage.dart';
import 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final GetStorage storage;

  SettingsCubit(this.storage)
      : super(SettingsState(
          name: storage.read(AppConst.user)['name'] ?? '',
          dateOfBirth:
              DateTime.parse(storage.read(AppConst.user)['created_at']),
          gender: storage.read(AppConst.user)['gender'] ?? 'Male',
          email: storage.read(AppConst.user)['email'] ?? '',
          phoneNumber: '',
        ));

  void updateName(String newName) {
    emit(state.copyWith(name: newName));
    storage.write(
        AppConst.user, {...storage.read(AppConst.user), 'name': newName});
  }

  void updateDateOfBirth(DateTime newDate) {
    emit(state.copyWith(dateOfBirth: newDate));
    storage.write(AppConst.user, {
      ...storage.read(AppConst.user),
      'created_at': newDate.toIso8601String()
    });
  }

  void updateGender(String newGender) {
    emit(state.copyWith(gender: newGender));
    storage.write(
        AppConst.user, {...storage.read(AppConst.user), 'gender': newGender});
  }

  void updateEmail(String newEmail) {
    emit(state.copyWith(email: newEmail));
    storage.write(
        AppConst.user, {...storage.read(AppConst.user), 'email': newEmail});
  }

  void updatePhoneNumber(String newPhoneNumber) {
    emit(state.copyWith(phoneNumber: newPhoneNumber));
    storage.write(AppConst.user,
        {...storage.read(AppConst.user), 'phoneNumber': newPhoneNumber});
  }
}
