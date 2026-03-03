import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../models/comment_response.dart';
import '../services/get_comments_service.dart';

class GetCommentsRepo {
  final GetCommentsService _service;

  GetCommentsRepo(this._service);

  Future<ApiResult<GetCommentsResponse>> getTaskComments(int taskId) async {
    try {
      final response = await _service.getTaskComments(taskId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
