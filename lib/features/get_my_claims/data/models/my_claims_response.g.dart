// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_claims_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MyClaimsResponse _$MyClaimsResponseFromJson(Map<String, dynamic> json) =>
    _MyClaimsResponse(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => MyClaimData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyClaimsResponseToJson(_MyClaimsResponse instance) =>
    <String, dynamic>{'success': instance.success, 'data': instance.data};

_MyClaimData _$MyClaimDataFromJson(Map<String, dynamic> json) => _MyClaimData(
  id: json['id'] as String,
  taskId: json['taskId'] as String,
  claimantId: json['claimantId'] as String,
  status: json['status'] as String,
  claimedAt: json['claimedAt'] as String,
  task: ClaimedTaskData.fromJson(json['task'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MyClaimDataToJson(_MyClaimData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'taskId': instance.taskId,
      'claimantId': instance.claimantId,
      'status': instance.status,
      'claimedAt': instance.claimedAt,
      'task': instance.task,
    };

_ClaimedTaskData _$ClaimedTaskDataFromJson(Map<String, dynamic> json) =>
    _ClaimedTaskData(
      id: json['id'] as String,
      creatorId: json['creatorId'] as String,
      assigneeId: json['assigneeId'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      deadline: json['deadline'] as String?,
      pointsOffered: (json['pointsOffered'] as num?)?.toInt(),
      status: json['status'] as String,
      priority: json['priority'] as String,
      category: json['category'] as String,
      numOfLikes: (json['numOfLikes'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String,
      completedAt: json['completedAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      isDeleted: json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$ClaimedTaskDataToJson(_ClaimedTaskData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creatorId': instance.creatorId,
      'assigneeId': instance.assigneeId,
      'title': instance.title,
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'deadline': instance.deadline,
      'pointsOffered': instance.pointsOffered,
      'status': instance.status,
      'priority': instance.priority,
      'category': instance.category,
      'numOfLikes': instance.numOfLikes,
      'createdAt': instance.createdAt,
      'completedAt': instance.completedAt,
      'updatedAt': instance.updatedAt,
      'isDeleted': instance.isDeleted,
    };
