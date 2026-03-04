import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_claims_response.freezed.dart';
part 'my_claims_response.g.dart';

@freezed
abstract class MyClaimsResponse with _$MyClaimsResponse {
  const factory MyClaimsResponse({
    required bool success,
    required List<MyClaimData> data,
  }) = _MyClaimsResponse;

  factory MyClaimsResponse.fromJson(Map<String, dynamic> json) =>
      _$MyClaimsResponseFromJson(json);
}

@freezed
abstract class MyClaimData with _$MyClaimData {
  const factory MyClaimData({
    required String id,
    required String taskId,
    required String claimantId,
    required String status,
    required String claimedAt,
    required ClaimedTaskData task,
  }) = _MyClaimData;

  factory MyClaimData.fromJson(Map<String, dynamic> json) =>
      _$MyClaimDataFromJson(json);
}

@freezed
abstract class ClaimedTaskData with _$ClaimedTaskData {
  const factory ClaimedTaskData({
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
  }) = _ClaimedTaskData;

  factory ClaimedTaskData.fromJson(Map<String, dynamic> json) =>
      _$ClaimedTaskDataFromJson(json);
}
