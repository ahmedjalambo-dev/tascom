import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../models/map_tasks_response.dart';
import '../services/map_service.dart';

class MapRepo {
  final MapService _service;

  MapRepo(this._service);

  Future<ApiResult<MapTasksResponse>> getMapTasks() async {
    try {
      final response = await _service.getMapTasks();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
