import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:tascom/features/claim_task/data/models/claim_task_response.dart';

part 'all_tasks_response.freezed.dart';
part 'all_tasks_response.g.dart';

@freezed
abstract class AllTasksResponse with _$AllTasksResponse {
  const factory AllTasksResponse({
    required bool success,
    required List<TaskResponseData> data,
    required PaginationMeta meta,
  }) = _AllTasksResponse;

  factory AllTasksResponse.fromJson(Map<String, dynamic> json) =>
      _$AllTasksResponseFromJson(json);
}

@freezed
abstract class TaskResponseData with _$TaskResponseData {
  const factory TaskResponseData({
    required String id,
    required String creatorId,
    required String title,
    required String description,
    double? latitude,
    double? longitude,
    String? deadline,
    int? pointsOffered,
    required String status,
    required String priority,
    required String category,
    bool? saved,
    int? numOfLikes,
    required String createdAt,
    String? updatedAt,
    bool? isDeleted,
    @Default([]) List<ClaimTaskData> claims,
    @Default([]) List<dynamic> assets,
  }) = _TaskResponseData;

  factory TaskResponseData.fromJson(Map<String, dynamic> json) =>
      _$TaskResponseDataFromJson(json);
}

@freezed
abstract class PaginationMeta with _$PaginationMeta {
  const factory PaginationMeta({
    required int total,
    required int page,
    required int limit,
    required int totalPages,
  }) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);
}
