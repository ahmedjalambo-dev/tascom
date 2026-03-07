import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_result.dart';
import '../data/repos/delete_comment_repo.dart';
import 'delete_comment_state.dart';

class DeleteCommentCubit extends Cubit<DeleteCommentState> {
  final DeleteCommentRepo _repo;

  DeleteCommentCubit(this._repo) : super(const DeleteCommentState.initial());

  Future<void> deleteComment(int id) async {
    emit(const DeleteCommentState.loading());

    final result = await _repo.deleteComment(id);

    switch (result) {
      case Success(data: final response):
        emit(DeleteCommentState.success(response.data?.id ?? id.toString()));
      case Failure(error: final error):
        emit(DeleteCommentState.error(error));
    }
  }

  void reset() => emit(const DeleteCommentState.initial());
}
