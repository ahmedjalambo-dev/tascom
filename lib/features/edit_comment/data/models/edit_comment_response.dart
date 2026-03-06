import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../get_comments/data/models/comment_response.dart';

part 'edit_comment_response.freezed.dart';
part 'edit_comment_response.g.dart';

@freezed
abstract class EditCommentResponse with _$EditCommentResponse {
  const factory EditCommentResponse({bool? success, CommentModel? data}) =
      _EditCommentResponse;

  factory EditCommentResponse.fromJson(Map<String, dynamic> json) =>
      _$EditCommentResponseFromJson(json);
}
