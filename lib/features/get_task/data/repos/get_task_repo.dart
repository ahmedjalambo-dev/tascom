import 'package:tascom/core/networking/api_error_handler.dart';
import 'package:tascom/core/networking/api_result.dart';
import 'package:tascom/features/get_tasks/data/models/all_tasks_response.dart';
import '../services/get_task_service.dart';

class GetTaskRepo {
  final GetTaskService _service;

  GetTaskRepo(this._service);

  Future<ApiResult<TaskResponseData>> getTask(int id) async {
    try {
      final response = await _service.getTask(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
