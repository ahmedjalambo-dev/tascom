import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../home/data/models/task_category.dart';
import '../../../home/data/models/task_priority.dart';
import '../models/create_task_request.dart';
import '../services/create_task_service.dart';

class CreateTaskRepo {
  final CreateTaskService _service;

  CreateTaskRepo(this._service);

  Future<ApiResult<void>> createTask(CreateTaskRequest request) async {
    try {
      await _service.createTask(
        title: request.title,
        description: request.description,
        category: request.category.toApiValue,
        priority: request.priority.toApiValue,
        latitude: request.latitude,
        longitude: request.longitude,
        deadline: request.deadline?.toUtc().toIso8601String(),
        file: request.file,
      );
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
