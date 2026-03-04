import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tascom/features/claim_task/data/models/claim_task_response.dart';

part 'my_tasks_response.freezed.dart';
part 'my_tasks_response.g.dart';

@freezed
abstract class MyTasksResponse with _$MyTasksResponse {
  const factory MyTasksResponse({
    required bool success,
    required List<MyTaskData> data,
  }) = _MyTasksResponse;

  factory MyTasksResponse.fromJson(Map<String, dynamic> json) =>
      _$MyTasksResponseFromJson(json);
}

@freezed
abstract class MyTaskData with _$MyTaskData {
  const factory MyTaskData({
    required String id,
    required String creatorId,
    String? assigneeId,
    required String title,
    required String description,
    double? latitude,
    double? longitude,
    String? deadline,
    int? pointsOffered,
    required String status,
    required String priority,
    required String category,
    int? numOfLikes,
    required String createdAt,
    String? completedAt,
    String? updatedAt,
    bool? isDeleted,
    @Default([]) List<ClaimTaskData> claims,
  }) = _MyTaskData;

  factory MyTaskData.fromJson(Map<String, dynamic> json) =>
      _$MyTaskDataFromJson(json);
}
