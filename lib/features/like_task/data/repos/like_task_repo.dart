import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../models/like_task_response.dart';
import '../services/like_task_service.dart';

class LikeTaskRepo {
  final LikeTaskService _service;

  LikeTaskRepo(this._service);

  Future<ApiResult<LikeTaskResponse>> likeTask(int id) async {
    try {
      final response = await _service.likeTask(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
