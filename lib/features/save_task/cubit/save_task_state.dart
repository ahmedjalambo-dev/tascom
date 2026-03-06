import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_error_model.dart';
import '../data/models/save_task_response.dart';

part 'save_task_state.freezed.dart';

@freezed
abstract class SaveTaskState with _$SaveTaskState {
  const factory SaveTaskState.initial() = _Initial;
  const factory SaveTaskState.loading({required String taskId}) = _Loading;
  const factory SaveTaskState.success(SaveTaskData data) = _Success;
  const factory SaveTaskState.error(ApiErrorModel error) = _Error;
}
