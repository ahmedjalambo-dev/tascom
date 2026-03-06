// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_task_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SaveTaskResponse _$SaveTaskResponseFromJson(Map<String, dynamic> json) =>
    _SaveTaskResponse(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : SaveTaskData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SaveTaskResponseToJson(_SaveTaskResponse instance) =>
    <String, dynamic>{'success': instance.success, 'data': instance.data};

_SaveTaskData _$SaveTaskDataFromJson(Map<String, dynamic> json) =>
    _SaveTaskData(
      taskId: json['taskId'] as String?,
      userId: json['userId'] as String?,
      isSaved: json['isSaved'] as bool?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$SaveTaskDataToJson(_SaveTaskData instance) =>
    <String, dynamic>{
      'taskId': instance.taskId,
      'userId': instance.userId,
      'isSaved': instance.isSaved,
      'createdAt': instance.createdAt,
    };
