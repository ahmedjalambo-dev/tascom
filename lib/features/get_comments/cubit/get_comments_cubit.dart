import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_result.dart';

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
}
