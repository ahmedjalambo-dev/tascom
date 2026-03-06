import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../models/saved_tasks_response.dart';
import '../services/saved_tasks_service.dart';

class SavedTasksRepo {
  final SavedTasksService _service;

  SavedTasksRepo(this._service);

  Future<ApiResult<SavedTasksResponse>> getSavedTasks() async {
    try {
      final response = await _service.getSavedTasks();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
