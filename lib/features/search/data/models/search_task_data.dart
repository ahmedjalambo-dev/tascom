import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_task_data.freezed.dart';
part 'search_task_data.g.dart';

@freezed
abstract class SearchTaskData with _$SearchTaskData {
  const factory SearchTaskData({
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
    @Default([]) List<SearchTaskAsset> assets,
    SearchTaskCreator? creator,
    @Default(0) double distance,
    @Default(false) bool isExpired,
    @Default(0) int remainingHours,
    @Default(0) int remainingDays,
  }) = _SearchTaskData;

  factory SearchTaskData.fromJson(Map<String, dynamic> json) =>
      _$SearchTaskDataFromJson(json);
}

@freezed
abstract class SearchTaskCreator with _$SearchTaskCreator {
  const factory SearchTaskCreator({required String id, required String name}) =
      _SearchTaskCreator;

  factory SearchTaskCreator.fromJson(Map<String, dynamic> json) =>
      _$SearchTaskCreatorFromJson(json);
}

@freezed
abstract class SearchTaskAsset with _$SearchTaskAsset {
  const factory SearchTaskAsset({String? id, String? url}) = _SearchTaskAsset;

  factory SearchTaskAsset.fromJson(Map<String, dynamic> json) =>
      _$SearchTaskAssetFromJson(json);
}
