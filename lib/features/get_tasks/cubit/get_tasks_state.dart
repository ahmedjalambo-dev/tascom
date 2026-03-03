import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_error_model.dart';
import '../../user/data/models/user_model.dart';
import '../data/models/all_tasks_response.dart';

part 'get_tasks_state.freezed.dart';

@freezed
abstract class GetTasksState with _$GetTasksState {
  const factory GetTasksState.initial() = GetTasksInitial;

  const factory GetTasksState.loading() = GetTasksLoading;

  const factory GetTasksState.success({
    required AllTasksResponse response,
    required Map<String, UserModel> creators,
    required Map<String, String> locationNames,
  }) = GetTasksSuccess;

  const factory GetTasksState.loadingMore({
    required AllTasksResponse currentData,
    required Map<String, UserModel> creators,
    required Map<String, String> locationNames,
  }) = GetTasksLoadingMore;

  const factory GetTasksState.error(ApiErrorModel error) = GetTasksError;
}
