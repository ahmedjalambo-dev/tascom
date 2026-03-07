import 'package:tascom/core/networking/api_error_model.dart';
import 'package:tascom/features/get_tasks/data/models/all_tasks_response.dart';

sealed class GetTaskState {
  const GetTaskState();
}

class GetTaskInitial extends GetTaskState {
  const GetTaskInitial();
}

class GetTaskLoading extends GetTaskState {
  const GetTaskLoading();
}

class GetTaskSuccess extends GetTaskState {
  final TaskResponseData data;
  const GetTaskSuccess(this.data);
}

class GetTaskError extends GetTaskState {
  final ApiErrorModel error;
  const GetTaskError(this.error);
}
