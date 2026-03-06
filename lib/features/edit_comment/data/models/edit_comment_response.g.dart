// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EditCommentResponse _$EditCommentResponseFromJson(Map<String, dynamic> json) =>
    _EditCommentResponse(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : CommentModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EditCommentResponseToJson(
  _EditCommentResponse instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};
