import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_result.dart';

import '../data/models/comment_response.dart';
import '../data/repos/get_comments_repo.dart';
import 'get_comments_state.dart';

class GetCommentsCubit extends Cubit<GetCommentsState> {
  final GetCommentsRepo _repo;

  GetCommentsCubit(this._repo) : super(const GetCommentsState.initial());

  Future<void> emitGetTaskComments(int taskId) async {
    emit(const GetCommentsState.loading());
    final result = await _repo.getTaskComments(taskId);

    switch (result) {
      case Success(data: final response):
        emit(GetCommentsState.success(response.data ?? []));
      case Failure(error: final error):
        emit(GetCommentsState.error(error.message ?? 'Unknown error occurred'));
    }
  }

  void removeComment(String commentId) {
    state.maybeWhen(
      success: (comments) {
        final updated = comments
            .where((c) => c.id != commentId)
            .map(
              (c) => c.copyWith(
                replies: c.replies.where((r) => r.id != commentId).toList(),
              ),
            )
            .toList();
        emit(GetCommentsState.success(updated));
      },
      orElse: () {},
    );
  }

  void addComment(CommentModel comment, {String? parentId}) {
    state.maybeWhen(
      success: (comments) {
        if (parentId != null) {
          final updated = comments.map((c) {
            if (c.id == parentId) {
              return c.copyWith(replies: [...c.replies, comment]);
            }
            return c;
          }).toList();
          emit(GetCommentsState.success(updated));
        } else {
          emit(GetCommentsState.success([...comments, comment]));
        }
      },
      orElse: () {},
    );
  }
}
