import 'package:freezed_annotation/freezed_annotation.dart';

part 'save_task_response.freezed.dart';
part 'save_task_response.g.dart';

@freezed
abstract class SaveTaskResponse with _$SaveTaskResponse {
  const factory SaveTaskResponse({bool? success, SaveTaskData? data}) =
      _SaveTaskResponse;

  factory SaveTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$SaveTaskResponseFromJson(json);
}

@freezed
abstract class SaveTaskData with _$SaveTaskData {
  const factory SaveTaskData({
    String? taskId,
    String? userId,
    bool? isSaved,
    String? createdAt,
  }) = _SaveTaskData;

  factory SaveTaskData.fromJson(Map<String, dynamic> json) =>
      _$SaveTaskDataFromJson(json);
}
