import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../get_comments/data/models/comment_response.dart';

part 'delete_comment_response.freezed.dart';
part 'delete_comment_response.g.dart';

@freezed
abstract class DeleteCommentResponse with _$DeleteCommentResponse {
  const factory DeleteCommentResponse({bool? success, CommentModel? data}) =
      _DeleteCommentResponse;

  factory DeleteCommentResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteCommentResponseFromJson(json);
}
