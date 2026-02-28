import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_result.dart';
import '../data/repos/claim_task_repo.dart';
import 'claim_task_state.dart';

class ClaimTaskCubit extends Cubit<ClaimTaskState> {
  final ClaimTaskRepo _repo;

  ClaimTaskCubit(this._repo) : super(const ClaimTaskState.initial());

  Future<void> claimTask(String taskId) async {
    emit(ClaimTaskState.loading(taskId: taskId));

    final result = await _repo.claimTask(taskId);

    result.when(
      success: (response) => emit(ClaimTaskState.success(response: response)),
      failure: (error) => emit(ClaimTaskState.error(error)),
    );
  }
}
