import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../get_tasks/data/models/all_tasks_response.dart';

part 'saved_tasks_response.freezed.dart';
part 'saved_tasks_response.g.dart';

@freezed
abstract class SavedTasksResponse with _$SavedTasksResponse {
  const factory SavedTasksResponse({
    bool? success,
    @Default([]) List<TaskResponseData> data,
  }) = _SavedTasksResponse;

  factory SavedTasksResponse.fromJson(Map<String, dynamic> json) =>
      _$SavedTasksResponseFromJson(json);
}
