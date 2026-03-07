import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_error_model.dart';
import '../../get_comments/data/models/comment_response.dart';

part 'create_comment_state.freezed.dart';

@freezed
abstract class CreateCommentState with _$CreateCommentState {
  const factory CreateCommentState.initial() = _Initial;
  const factory CreateCommentState.loading() = _Loading;
  const factory CreateCommentState.success(CommentModel comment) = _Success;
  const factory CreateCommentState.error(ApiErrorModel error) = _Error;
}
