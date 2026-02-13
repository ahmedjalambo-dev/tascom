import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_error_model.dart';

part 'delete_account_state.freezed.dart';

@freezed
abstract class DeleteAccountState with _$DeleteAccountState {
  const factory DeleteAccountState.initial() = _Initial;
  const factory DeleteAccountState.loading() = _Loading;
  const factory DeleteAccountState.success() = _Success;
  const factory DeleteAccountState.error(ApiErrorModel error) = _Error;
}