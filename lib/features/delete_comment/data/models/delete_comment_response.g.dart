// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeleteCommentResponse _$DeleteCommentResponseFromJson(
  Map<String, dynamic> json,
) => _DeleteCommentResponse(
  success: json['success'] as bool?,
  data: json['data'] == null
      ? null
      : CommentModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DeleteCommentResponseToJson(
  _DeleteCommentResponse instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};
