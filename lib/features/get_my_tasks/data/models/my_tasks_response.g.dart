// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_tasks_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MyTasksResponse _$MyTasksResponseFromJson(Map<String, dynamic> json) =>
    _MyTasksResponse(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => MyTaskData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyTasksResponseToJson(_MyTasksResponse instance) =>
    <String, dynamic>{'success': instance.success, 'data': instance.data};

_MyTaskData _$MyTaskDataFromJson(Map<String, dynamic> json) => _MyTaskData(
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
  claims:
      (json['claims'] as List<dynamic>?)
          ?.map((e) => ClaimTaskData.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$MyTaskDataToJson(_MyTaskData instance) =>
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
      'claims': instance.claims,
    };
