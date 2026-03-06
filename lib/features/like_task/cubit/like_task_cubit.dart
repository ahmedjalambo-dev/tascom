import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_result.dart';
import '../data/repos/like_task_repo.dart';
import 'like_task_state.dart';

class LikeTaskCubit extends Cubit<LikeTaskState> {
  final LikeTaskRepo _repo;

  LikeTaskCubit(this._repo) : super(const LikeTaskState.initial());

  Future<void> likeTask(String taskId) async {
    emit(LikeTaskState.loading(taskId: taskId));

    final id = int.tryParse(taskId);
    if (id == null) return;

    final result = await _repo.likeTask(id);

    switch (result) {
      case Success(data: final response):
        emit(LikeTaskState.success(response.data!));
      case Failure(error: final error):
        emit(LikeTaskState.error(error));
    }
  }

  void reset() => emit(const LikeTaskState.initial());
}
