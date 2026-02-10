// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    _RegisterResponse(
      message: json['message'] as String?,
      userId: json['userId'] as String?,
      user: json['user'] == null
          ? null
          : RegisterUserData.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterResponseToJson(_RegisterResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'userId': instance.userId,
      'user': instance.user,
    };

_RegisterUserData _$RegisterUserDataFromJson(Map<String, dynamic> json) =>
    _RegisterUserData(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$RegisterUserDataToJson(_RegisterUserData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };
