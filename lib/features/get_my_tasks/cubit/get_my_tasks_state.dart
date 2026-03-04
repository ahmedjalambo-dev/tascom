import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_error_model.dart';
import '../../home/data/models/task_model.dart';

part 'get_my_tasks_state.freezed.dart';

@freezed
abstract class GetMyTasksState with _$GetMyTasksState {
  const factory GetMyTasksState.initial() = _Initial;
  const factory GetMyTasksState.loading() = _Loading;
  const factory GetMyTasksState.success(List<TaskModel> tasks) = _Success;
  const factory GetMyTasksState.error(ApiErrorModel error) = _Error;
}
