import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../models/my_tasks_response.dart';
import '../services/get_my_tasks_service.dart';

class GetMyTasksRepo {
  final GetMyTasksService _service;

  GetMyTasksRepo(this._service);

  Future<ApiResult<MyTasksResponse>> getMyTasks() async {
    try {
      final response = await _service.getMyTasks();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
