import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../models/save_task_response.dart';
import '../services/save_task_service.dart';

class SaveTaskRepo {
  final SaveTaskService _service;

  SaveTaskRepo(this._service);

  Future<ApiResult<SaveTaskResponse>> saveTask(int id) async {
    try {
      final response = await _service.saveTask(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
