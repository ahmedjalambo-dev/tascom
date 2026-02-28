import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../models/claim_task_response.dart';
import '../services/claim_task_service.dart';

class ClaimTaskRepo {
  final ClaimTaskService _service;

  ClaimTaskRepo(this._service);

  Future<ApiResult<ClaimTaskResponse>> claimTask(String taskId) async {
    try {
      final response = await _service.claimTask({
        'taskId': int.parse(taskId),
      });
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
