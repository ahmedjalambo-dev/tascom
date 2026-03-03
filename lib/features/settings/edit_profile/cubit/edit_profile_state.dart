import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_error_model.dart';
import '../../../user/data/models/user_model.dart';

part 'edit_profile_state.freezed.dart';

@freezed
abstract class EditProfileState with _$EditProfileState {
  const factory EditProfileState.initial() = _Initial;
  const factory EditProfileState.loading() = _Loading;
  const factory EditProfileState.loaded(UserModel user) = _Loaded;
  const factory EditProfileState.updateSuccess(UserModel user) = _UpdateSuccess;
  const factory EditProfileState.error(ApiErrorModel error) = _Error;
}
