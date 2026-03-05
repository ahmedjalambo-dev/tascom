import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_tasks_response.freezed.dart';
part 'map_tasks_response.g.dart';

@freezed
abstract class MapTasksResponse with _$MapTasksResponse {
  const factory MapTasksResponse({
    required bool success,
    required MapTasksData data,
  }) = _MapTasksResponse;

  factory MapTasksResponse.fromJson(Map<String, dynamic> json) =>
      _$MapTasksResponseFromJson(json);
}

@freezed
abstract class MapTasksData with _$MapTasksData {
  const factory MapTasksData({
    required List<MapTaskData> data,
    required int total,
  }) = _MapTasksData;

  factory MapTasksData.fromJson(Map<String, dynamic> json) =>
      _$MapTasksDataFromJson(json);
}

@freezed
abstract class MapTaskData with _$MapTaskData {
  const factory MapTaskData({
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
    @Default([]) List<dynamic> assets,
    required MapTaskCreator creator,
    @Default(0) double distance,
    @Default(false) bool isExpired,
    int? remainingHours,
    int? remainingDays,
  }) = _MapTaskData;

  factory MapTaskData.fromJson(Map<String, dynamic> json) =>
      _$MapTaskDataFromJson(json);
}

@freezed
abstract class MapTaskCreator with _$MapTaskCreator {
  const factory MapTaskCreator({
    required String id,
    required String name,
  }) = _MapTaskCreator;

  factory MapTaskCreator.fromJson(Map<String, dynamic> json) =>
      _$MapTaskCreatorFromJson(json);
}
