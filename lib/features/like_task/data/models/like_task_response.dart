import 'package:freezed_annotation/freezed_annotation.dart';

part 'like_task_response.freezed.dart';
part 'like_task_response.g.dart';

@freezed
abstract class LikeTaskResponse with _$LikeTaskResponse {
  const factory LikeTaskResponse({
    bool? success,
    LikeTaskData? data,
  }) = _LikeTaskResponse;

  factory LikeTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$LikeTaskResponseFromJson(json);
}

@freezed
abstract class LikeTaskData with _$LikeTaskData {
  const factory LikeTaskData({
    String? id,
    int? numOfLikes,
    @Default([]) List<LikeInfo> likes,
  }) = _LikeTaskData;

  factory LikeTaskData.fromJson(Map<String, dynamic> json) =>
      _$LikeTaskDataFromJson(json);
}

@freezed
abstract class LikeInfo with _$LikeInfo {
  const factory LikeInfo({
    String? taskId,
    String? userId,
    bool? likeStatus,
    String? createdAt,
  }) = _LikeInfo;

  factory LikeInfo.fromJson(Map<String, dynamic> json) =>
      _$LikeInfoFromJson(json);
}
