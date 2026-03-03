import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../get_comments/data/models/comment_response.dart';

part 'create_comment_response.freezed.dart';
part 'create_comment_response.g.dart';

@freezed
abstract class CreateCommentResponse with _$CreateCommentResponse {
  const factory CreateCommentResponse({bool? success, CommentModel? data}) =
      _CreateCommentResponse;

  factory CreateCommentResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCommentResponseFromJson(json);
}
