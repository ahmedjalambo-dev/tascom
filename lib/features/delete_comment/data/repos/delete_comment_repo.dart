import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../models/delete_comment_response.dart';
import '../services/delete_comment_service.dart';

class DeleteCommentRepo {
  final DeleteCommentService _service;

  DeleteCommentRepo(this._service);

  Future<ApiResult<DeleteCommentResponse>> deleteComment(int id) async {
    try {
      final response = await _service.deleteComment(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
