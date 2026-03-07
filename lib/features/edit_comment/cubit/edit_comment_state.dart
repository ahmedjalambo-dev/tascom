import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_error_model.dart';
import '../../get_comments/data/models/comment_response.dart';

part 'edit_comment_state.freezed.dart';

@freezed
abstract class EditCommentState with _$EditCommentState {
  const factory EditCommentState.initial() = _Initial;
  const factory EditCommentState.loading() = _Loading;
  const factory EditCommentState.success(CommentModel comment) = _Success;
  const factory EditCommentState.error(ApiErrorModel error) = _Error;
}
