import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../models/all_tasks_response.dart';
import '../services/home_service.dart';

class HomeRepo {
  final HomeService _homeService;

  HomeRepo(this._homeService);

  Future<ApiResult<AllTasksResponse>> getAllTasks({
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final response = await _homeService.getAllTasks(page, limit);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
