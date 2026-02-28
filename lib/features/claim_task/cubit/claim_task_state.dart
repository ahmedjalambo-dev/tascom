import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_error_model.dart';
import '../data/models/claim_task_response.dart';

part 'claim_task_state.freezed.dart';

@freezed
abstract class ClaimTaskState with _$ClaimTaskState {
  const factory ClaimTaskState.initial() = _Initial;
  const factory ClaimTaskState.loading({required String taskId}) = _Loading;
  const factory ClaimTaskState.success({
    required ClaimTaskResponse response,
  }) = _Success;
  const factory ClaimTaskState.error(ApiErrorModel error) = _Error;
}
