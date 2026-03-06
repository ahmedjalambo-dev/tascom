import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_error_model.dart';
import '../data/models/like_task_response.dart';

part 'like_task_state.freezed.dart';

@freezed
abstract class LikeTaskState with _$LikeTaskState {
  const factory LikeTaskState.initial() = _Initial;
  const factory LikeTaskState.loading({required String taskId}) = _Loading;
  const factory LikeTaskState.success(LikeTaskData data) = _Success;
  const factory LikeTaskState.error(ApiErrorModel error) = _Error;
}
