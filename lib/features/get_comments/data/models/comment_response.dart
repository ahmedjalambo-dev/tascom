import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_response.freezed.dart';
part 'comment_response.g.dart';

@freezed
abstract class GetCommentsResponse with _$GetCommentsResponse {
  const factory GetCommentsResponse({bool? success, List<CommentModel>? data}) =
      _GetCommentsResponse;

  factory GetCommentsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCommentsResponseFromJson(json);
}

@freezed
abstract class CommentModel with _$CommentModel {
  const factory CommentModel({
    String? id,
    String? taskId,
    String? userId,
    String? content,
    String? replyId,
    String? createdAt,
    String? updatedAt,
    String? status,
    CommentUserModel? user,
    @Default([]) List<CommentModel> replies,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}

@freezed
abstract class CommentUserModel with _$CommentUserModel {
  const factory CommentUserModel({String? id, String? name, String? avatar}) =
      _CommentUserModel;

  factory CommentUserModel.fromJson(Map<String, dynamic> json) =>
      _$CommentUserModelFromJson(json);
}
