// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_comment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateCommentRequest _$CreateCommentRequestFromJson(
  Map<String, dynamic> json,
) => _CreateCommentRequest(
  taskId: (json['taskId'] as num).toInt(),
  content: json['content'] as String,
  replyId: (json['replyId'] as num?)?.toInt(),
);

Map<String, dynamic> _$CreateCommentRequestToJson(
  _CreateCommentRequest instance,
) => <String, dynamic>{
  'taskId': instance.taskId,
  'content': instance.content,
  'replyId': instance.replyId,
};
