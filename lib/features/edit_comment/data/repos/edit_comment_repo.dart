import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../models/edit_comment_request.dart';
import '../models/edit_comment_response.dart';
import '../services/edit_comment_service.dart';

class EditCommentRepo {
  final EditCommentService _service;

  EditCommentRepo(this._service);

  Future<ApiResult<EditCommentResponse>> editComment(
    int id,
    EditCommentRequest request,
  ) async {
    try {
      final response = await _service.editComment(id, request);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
