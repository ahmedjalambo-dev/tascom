import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_result.dart';
import '../data/repos/save_task_repo.dart';
import 'save_task_state.dart';

class SaveTaskCubit extends Cubit<SaveTaskState> {
  final SaveTaskRepo _repo;

  SaveTaskCubit(this._repo) : super(const SaveTaskState.initial());

  Future<void> saveTask(String taskId) async {
    emit(SaveTaskState.loading(taskId: taskId));

    final id = int.tryParse(taskId);
    if (id == null) return;

    final result = await _repo.saveTask(id);

    switch (result) {
      case Success(data: final response):
        emit(SaveTaskState.success(response.data!));
      case Failure(error: final error):
        emit(SaveTaskState.error(error));
    }
  }

  void reset() => emit(const SaveTaskState.initial());
}
