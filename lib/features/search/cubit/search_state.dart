import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_error_model.dart';
import '../../get_tasks/data/models/all_tasks_response.dart';
import '../data/models/search_meta.dart';
import '../data/models/search_person_data.dart';

part 'search_state.freezed.dart';

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState.initial() = SearchInitial;

  const factory SearchState.loading() = SearchLoading;

  const factory SearchState.tasksSuccess({
    required List<TaskResponseData> tasks,
    required SearchMeta meta,
  }) = SearchTasksSuccess;

  const factory SearchState.peopleSuccess({
    required List<SearchPersonData> people,
    required SearchMeta meta,
  }) = SearchPeopleSuccess;

  const factory SearchState.loadingMore({
    required List<dynamic> currentItems,
    required SearchMeta meta,
  }) = SearchLoadingMore;

  const factory SearchState.empty() = SearchEmpty;

  const factory SearchState.error(ApiErrorModel error) = SearchError;
}
