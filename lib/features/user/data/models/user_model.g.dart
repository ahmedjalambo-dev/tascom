// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  phoneNumber: json['phoneNumber'] as String?,
  location: json['location'] as String?,
  about: json['about'] as String?,
  skills: json['skills'] as String?,
  dateOfBirth: json['DOB'] == null
      ? null
      : DateTime.parse(json['DOB'] as String),
  gender: json['gender'] as String?,
  avatar: _readAvatar(json, 'avatar') as String?,
  rating: (json['ratingAvg'] as num?)?.toDouble(),
  reviewCount: (json['reviewCount'] as num?)?.toInt(),
  points: (json['pointsBalance'] as num?)?.toInt(),
  postedCount: (json['postedCount'] as num?)?.toInt(),
  claimedCount: (json['claimedCount'] as num?)?.toInt(),
  completedCount: (json['completedCount'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'location': instance.location,
      'about': instance.about,
      'skills': instance.skills,
      'DOB': instance.dateOfBirth?.toIso8601String(),
      'gender': instance.gender,
      'avatar': instance.avatar,
      'ratingAvg': instance.rating,
      'reviewCount': instance.reviewCount,
      'pointsBalance': instance.points,
      'postedCount': instance.postedCount,
      'claimedCount': instance.claimedCount,
      'completedCount': instance.completedCount,
    };
