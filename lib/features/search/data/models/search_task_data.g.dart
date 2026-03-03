// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_task_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchTaskData _$SearchTaskDataFromJson(Map<String, dynamic> json) =>
    _SearchTaskData(
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
      assets:
          (json['assets'] as List<dynamic>?)
              ?.map((e) => SearchTaskAsset.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      creator: json['creator'] == null
          ? null
          : SearchTaskCreator.fromJson(json['creator'] as Map<String, dynamic>),
      distance: (json['distance'] as num?)?.toDouble() ?? 0,
      isExpired: json['isExpired'] as bool? ?? false,
      remainingHours: (json['remainingHours'] as num?)?.toInt() ?? 0,
      remainingDays: (json['remainingDays'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$SearchTaskDataToJson(_SearchTaskData instance) =>
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

_SearchTaskCreator _$SearchTaskCreatorFromJson(Map<String, dynamic> json) =>
    _SearchTaskCreator(id: json['id'] as String, name: json['name'] as String);

Map<String, dynamic> _$SearchTaskCreatorToJson(_SearchTaskCreator instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_SearchTaskAsset _$SearchTaskAssetFromJson(Map<String, dynamic> json) =>
    _SearchTaskAsset(id: json['id'] as String?, url: json['url'] as String?);

Map<String, dynamic> _$SearchTaskAssetToJson(_SearchTaskAsset instance) =>
    <String, dynamic>{'id': instance.id, 'url': instance.url};
