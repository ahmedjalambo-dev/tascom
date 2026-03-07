import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tascom/core/networking/api_result.dart';
import '../data/repos/get_task_repo.dart';
import 'get_task_state.dart';

class GetTaskCubit extends Cubit<GetTaskState> {
  final GetTaskRepo _repo;

  GetTaskCubit(this._repo) : super(const GetTaskInitial());

  Future<void> getTask(int id) async {
    emit(const GetTaskLoading());

    final result = await _repo.getTask(id);

    switch (result) {
      case Success(data: final data):
        emit(GetTaskSuccess(data));
      case Failure(error: final error):
        emit(GetTaskError(error));
    }
  }
}
