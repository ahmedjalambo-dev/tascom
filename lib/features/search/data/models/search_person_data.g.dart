// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_person_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchPersonData _$SearchPersonDataFromJson(Map<String, dynamic> json) =>
    _SearchPersonData(
      id: json['id'] as String,
      name: json['name'] as String,
      location: json['location'] as String?,
      ratingAvg: (json['ratingAvg'] as num?)?.toDouble(),
      skills: json['skills'] as String?,
      avatar: json['avatar'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$SearchPersonDataToJson(_SearchPersonData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'ratingAvg': instance.ratingAvg,
      'skills': instance.skills,
      'avatar': instance.avatar,
      'email': instance.email,
    };
