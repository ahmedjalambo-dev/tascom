import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_error_model.dart';
import '../../../get_tasks/data/models/all_tasks_response.dart';
import '../../../user/data/models/user_model.dart';

part 'saved_tasks_state.freezed.dart';

@freezed
abstract class SavedTasksState with _$SavedTasksState {
  const factory SavedTasksState.initial() = _Initial;
  const factory SavedTasksState.loading() = _Loading;
  const factory SavedTasksState.success({
    required List<TaskResponseData> tasks,
    required Map<String, UserModel> creators,
    required Map<String, String> locationNames,
  }) = _Success;
  const factory SavedTasksState.error(ApiErrorModel error) = _Error;
}
