import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_error_model.dart';
import '../../login/data/models/login_response.dart';

part 'google_login_state.freezed.dart';

@freezed
abstract class GoogleLoginState with _$GoogleLoginState {
  const factory GoogleLoginState.initial() = _Initial;
  const factory GoogleLoginState.loading() = _Loading;
  const factory GoogleLoginState.success(LoginResponse response) = _Success;
  const factory GoogleLoginState.error(ApiErrorModel error) = _Error;
}
