// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_tasks_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MapTasksResponse _$MapTasksResponseFromJson(Map<String, dynamic> json) =>
    _MapTasksResponse(
      success: json['success'] as bool,
      data: MapTasksData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MapTasksResponseToJson(_MapTasksResponse instance) =>
    <String, dynamic>{'success': instance.success, 'data': instance.data};

_MapTasksData _$MapTasksDataFromJson(Map<String, dynamic> json) =>
    _MapTasksData(
      data: (json['data'] as List<dynamic>)
          .map((e) => MapTaskData.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$MapTasksDataToJson(_MapTasksData instance) =>
    <String, dynamic>{'data': instance.data, 'total': instance.total};

_MapTaskData _$MapTaskDataFromJson(Map<String, dynamic> json) => _MapTaskData(
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
  assets: json['assets'] as List<dynamic>? ?? const [],
  creator: MapTaskCreator.fromJson(json['creator'] as Map<String, dynamic>),
  distance: (json['distance'] as num?)?.toDouble() ?? 0,
  isExpired: json['isExpired'] as bool? ?? false,
  remainingHours: (json['remainingHours'] as num?)?.toInt(),
  remainingDays: (json['remainingDays'] as num?)?.toInt(),
);

Map<String, dynamic> _$MapTaskDataToJson(_MapTaskData instance) =>
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
      'assets': instance.assets,
      'creator': instance.creator,
      'distance': instance.distance,
      'isExpired': instance.isExpired,
      'remainingHours': instance.remainingHours,
      'remainingDays': instance.remainingDays,
    };

_MapTaskCreator _$MapTaskCreatorFromJson(Map<String, dynamic> json) =>
    _MapTaskCreator(id: json['id'] as String, name: json['name'] as String);

Map<String, dynamic> _$MapTaskCreatorToJson(_MapTaskCreator instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
