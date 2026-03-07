// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_task_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LikeTaskResponse _$LikeTaskResponseFromJson(Map<String, dynamic> json) =>
    _LikeTaskResponse(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : LikeTaskData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LikeTaskResponseToJson(_LikeTaskResponse instance) =>
    <String, dynamic>{'success': instance.success, 'data': instance.data};

_LikeTaskData _$LikeTaskDataFromJson(Map<String, dynamic> json) =>
    _LikeTaskData(
      id: json['id'] as String?,
      numOfLikes: (json['numOfLikes'] as num?)?.toInt(),
      likes:
          (json['likes'] as List<dynamic>?)
              ?.map((e) => LikeInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$LikeTaskDataToJson(_LikeTaskData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'numOfLikes': instance.numOfLikes,
      'likes': instance.likes,
    };

_LikeInfo _$LikeInfoFromJson(Map<String, dynamic> json) => _LikeInfo(
  taskId: json['taskId'] as String?,
  userId: json['userId'] as String?,
  likeStatus: json['likeStatus'] as bool?,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$LikeInfoToJson(_LikeInfo instance) => <String, dynamic>{
  'taskId': instance.taskId,
  'userId': instance.userId,
  'likeStatus': instance.likeStatus,
  'createdAt': instance.createdAt,
};
