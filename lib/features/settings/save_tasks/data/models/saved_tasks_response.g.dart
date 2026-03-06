// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_tasks_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SavedTasksResponse _$SavedTasksResponseFromJson(Map<String, dynamic> json) =>
    _SavedTasksResponse(
      success: json['success'] as bool?,
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => TaskResponseData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SavedTasksResponseToJson(_SavedTasksResponse instance) =>
    <String, dynamic>{'success': instance.success, 'data': instance.data};
