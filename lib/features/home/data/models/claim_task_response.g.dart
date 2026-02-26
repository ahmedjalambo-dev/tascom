// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claim_task_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClaimTaskResponse _$ClaimTaskResponseFromJson(Map<String, dynamic> json) =>
    _ClaimTaskResponse(
      success: json['success'] as bool,
      data: ClaimTaskData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClaimTaskResponseToJson(_ClaimTaskResponse instance) =>
    <String, dynamic>{'success': instance.success, 'data': instance.data};

_ClaimTaskData _$ClaimTaskDataFromJson(Map<String, dynamic> json) =>
    _ClaimTaskData(
      id: json['id'] as String,
      taskId: json['taskId'] as String,
      claimantId: json['claimantId'] as String,
      status: json['status'] as String,
      claimedAt: json['claimedAt'] as String,
    );

Map<String, dynamic> _$ClaimTaskDataToJson(_ClaimTaskData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'taskId': instance.taskId,
      'claimantId': instance.claimantId,
      'status': instance.status,
      'claimedAt': instance.claimedAt,
    };
