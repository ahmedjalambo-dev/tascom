import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/comment_response.dart';

part 'get_comments_state.freezed.dart';

@freezed
class GetCommentsState with _$GetCommentsState {
  const factory GetCommentsState.initial() = _Initial;
  const factory GetCommentsState.loading() = _Loading;
  const factory GetCommentsState.success(List<CommentModel> comments) =
      _Success;
  const factory GetCommentsState.error(String message) = _Error;
}
