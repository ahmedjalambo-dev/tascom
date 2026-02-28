import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../models/all_tasks_response.dart';
import '../services/get_tasks_service.dart';

class GetTasksRepo {
  final GetTasksService _service;

  GetTasksRepo(this._service);

  Future<ApiResult<AllTasksResponse>> getAllTasks({
    int page = 1,
    int limit = 10,
    String? category,
  }) async {
    try {
      final response = await _service.getAllTasks(
        page,
        limit,
        category: category,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
