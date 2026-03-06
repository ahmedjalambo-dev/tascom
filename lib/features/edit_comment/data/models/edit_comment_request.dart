import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_comment_request.freezed.dart';
part 'edit_comment_request.g.dart';

@freezed
abstract class EditCommentRequest with _$EditCommentRequest {
  const factory EditCommentRequest({
    required String content,
  }) = _EditCommentRequest;

  factory EditCommentRequest.fromJson(Map<String, dynamic> json) =>
      _$EditCommentRequestFromJson(json);
}
