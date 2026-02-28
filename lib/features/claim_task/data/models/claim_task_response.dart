import 'package:freezed_annotation/freezed_annotation.dart';

part 'claim_task_response.freezed.dart';
part 'claim_task_response.g.dart';

@freezed
abstract class ClaimTaskResponse with _$ClaimTaskResponse {
  const factory ClaimTaskResponse({
    required bool success,
    required ClaimTaskData data,
  }) = _ClaimTaskResponse;

  factory ClaimTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$ClaimTaskResponseFromJson(json);
}

@freezed
abstract class ClaimTaskData with _$ClaimTaskData {
  const factory ClaimTaskData({
    required String id,
    required String taskId,
    required String claimantId,
    required String status,
    required String claimedAt,
  }) = _ClaimTaskData;

  factory ClaimTaskData.fromJson(Map<String, dynamic> json) =>
      _$ClaimTaskDataFromJson(json);
}
