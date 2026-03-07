import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_result.dart';
import '../data/models/edit_comment_request.dart';
import '../data/repos/edit_comment_repo.dart';
import 'edit_comment_state.dart';

class EditCommentCubit extends Cubit<EditCommentState> {
  final EditCommentRepo _repo;

  EditCommentCubit(this._repo) : super(const EditCommentState.initial());

  Future<void> editComment(int id, EditCommentRequest request) async {
    emit(const EditCommentState.loading());

    final result = await _repo.editComment(id, request);

    switch (result) {
      case Success(data: final response):
        emit(EditCommentState.success(response.data!));
      case Failure(error: final error):
        emit(EditCommentState.error(error));
    }
  }

  void reset() => emit(const EditCommentState.initial());
}
