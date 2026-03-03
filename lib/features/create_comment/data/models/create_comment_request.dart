import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_comment_request.freezed.dart';
part 'create_comment_request.g.dart';

@freezed
abstract class CreateCommentRequest with _$CreateCommentRequest {
  const factory CreateCommentRequest({
    required int taskId,
    required String content,
    int? replyId,
  }) = _CreateCommentRequest;

  factory CreateCommentRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateCommentRequestFromJson(json);
}
