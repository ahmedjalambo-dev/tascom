import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_result.dart';
import '../data/models/create_task_request.dart';
import '../data/repos/create_task_repo.dart';
import 'create_task_state.dart';

class CreateTaskCubit extends Cubit<CreateTaskState> {
  final CreateTaskRepo _repo;

  CreateTaskCubit(this._repo) : super(const CreateTaskState.initial());

  Future<void> createTask(CreateTaskRequest request) async {
    emit(const CreateTaskState.loading());

    final result = await _repo.createTask(request);

    result.when(
      success: (_) => emit(const CreateTaskState.success()),
      failure: (error) => emit(CreateTaskState.error(error)),
    );
  }
}
