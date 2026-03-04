import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_error_model.dart';

part 'delete_comment_state.freezed.dart';

@freezed
abstract class DeleteCommentState with _$DeleteCommentState {
  const factory DeleteCommentState.initial() = _Initial;
  const factory DeleteCommentState.loading() = _Loading;
  const factory DeleteCommentState.success(String commentId) = _Success;
  const factory DeleteCommentState.error(ApiErrorModel error) = _Error;
}
