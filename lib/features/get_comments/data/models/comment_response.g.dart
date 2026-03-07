// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetCommentsResponse _$GetCommentsResponseFromJson(Map<String, dynamic> json) =>
    _GetCommentsResponse(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCommentsResponseToJson(
  _GetCommentsResponse instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};

_CommentModel _$CommentModelFromJson(Map<String, dynamic> json) =>
    _CommentModel(
      id: json['id'] as String?,
      taskId: json['taskId'] as String?,
      userId: json['userId'] as String?,
      content: json['content'] as String?,
      replyId: json['replyId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      status: json['status'] as String?,
      user: json['user'] == null
          ? null
          : CommentUserModel.fromJson(json['user'] as Map<String, dynamic>),
      replies:
          (json['replies'] as List<dynamic>?)
              ?.map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CommentModelToJson(_CommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'taskId': instance.taskId,
      'userId': instance.userId,
      'content': instance.content,
      'replyId': instance.replyId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'status': instance.status,
      'user': instance.user,
      'replies': instance.replies,
    };

_CommentUserModel _$CommentUserModelFromJson(Map<String, dynamic> json) =>
    _CommentUserModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      avatar: _readCommentUserAvatar(json, 'avatar') as String?,
    );

Map<String, dynamic> _$CommentUserModelToJson(_CommentUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
    };
