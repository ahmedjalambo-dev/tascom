// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateCommentResponse _$CreateCommentResponseFromJson(
  Map<String, dynamic> json,
) => _CreateCommentResponse(
  success: json['success'] as bool?,
  data: json['data'] == null
      ? null
      : CommentModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CreateCommentResponseToJson(
  _CreateCommentResponse instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};
