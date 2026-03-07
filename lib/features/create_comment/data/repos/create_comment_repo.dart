import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../models/create_comment_request.dart';
import '../models/create_comment_response.dart';
import '../services/create_comment_service.dart';

class CreateCommentRepo {
  final CreateCommentService _service;

  CreateCommentRepo(this._service);

  Future<ApiResult<CreateCommentResponse>> createComment(
    CreateCommentRequest request,
  ) async {
    try {
      final response = await _service.createComment(request);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
