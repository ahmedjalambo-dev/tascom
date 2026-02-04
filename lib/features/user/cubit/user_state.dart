import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_error_model.dart';
import '../data/models/user_model.dart';

part 'user_state.freezed.dart';

@freezed
abstract class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.loading() = _Loading;
  const factory UserState.loaded(UserModel user) = _Loaded;
  const factory UserState.updateSuccess(UserModel user) = _UpdateSuccess;
  const factory UserState.deleteSuccess() = _DeleteSuccess;
  const factory UserState.error(ApiErrorModel error) = _Error;
}
