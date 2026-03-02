// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchMeta _$SearchMetaFromJson(Map<String, dynamic> json) => _SearchMeta(
  total: (json['total'] as num).toInt(),
  page: (json['page'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
);

Map<String, dynamic> _$SearchMetaToJson(_SearchMeta instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
    };
