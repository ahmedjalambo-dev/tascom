// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_tasks_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AllTasksResponse _$AllTasksResponseFromJson(Map<String, dynamic> json) =>
    _AllTasksResponse(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => TaskResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AllTasksResponseToJson(_AllTasksResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'meta': instance.meta,
    };

_TaskResponseData _$TaskResponseDataFromJson(Map<String, dynamic> json) =>
    _TaskResponseData(
      id: json['id'] as String,
      creatorId: json['creatorId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      deadline: json['deadline'] as String?,
      pointsOffered: (json['pointsOffered'] as num?)?.toInt(),
      status: json['status'] as String,
      priority: json['priority'] as String,
      category: json['category'] as String,
      saved: json['saved'] as bool?,
      liked: json['liked'] as bool?,
      numOfLikes: (json['numOfLikes'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      claims:
          (json['claims'] as List<dynamic>?)
              ?.map((e) => ClaimTaskData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      assets: json['assets'] as List<dynamic>? ?? const [],
    );

Map<String, dynamic> _$TaskResponseDataToJson(_TaskResponseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creatorId': instance.creatorId,
      'title': instance.title,
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'deadline': instance.deadline,
      'pointsOffered': instance.pointsOffered,
      'status': instance.status,
      'priority': instance.priority,
      'category': instance.category,
      'saved': instance.saved,
      'liked': instance.liked,
      'numOfLikes': instance.numOfLikes,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isDeleted': instance.isDeleted,
      'claims': instance.claims,
      'assets': instance.assets,
    };

_PaginationMeta _$PaginationMetaFromJson(Map<String, dynamic> json) =>
    _PaginationMeta(
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
    );

Map<String, dynamic> _$PaginationMetaToJson(_PaginationMeta instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
      'totalPages': instance.totalPages,
    };
