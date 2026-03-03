// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    _LoginResponse(
      success: json['success'] as bool,
      data: LoginData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(_LoginResponse instance) =>
    <String, dynamic>{'success': instance.success, 'data': instance.data};

_LoginData _$LoginDataFromJson(Map<String, dynamic> json) => _LoginData(
  user: UserAuthData.fromJson(json['user'] as Map<String, dynamic>),
  token: json['token'] as String,
);

Map<String, dynamic> _$LoginDataToJson(_LoginData instance) =>
    <String, dynamic>{'user': instance.user, 'token': instance.token};

_UserAuthData _$UserAuthDataFromJson(Map<String, dynamic> json) =>
    _UserAuthData(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      role: json['role'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      avatar: json['avatar'] as String?,
      pointsBalance: (json['pointsBalance'] as num?)?.toInt(),
      ratingAvg: (json['ratingAvg'] as num?)?.toDouble(),
      about: json['about'] as String?,
      skills: json['skills'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$UserAuthDataToJson(_UserAuthData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
      'phoneNumber': instance.phoneNumber,
      'avatar': instance.avatar,
      'pointsBalance': instance.pointsBalance,
      'ratingAvg': instance.ratingAvg,
      'about': instance.about,
      'skills': instance.skills,
      'location': instance.location,
    };
