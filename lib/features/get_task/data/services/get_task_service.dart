import 'package:dio/dio.dart';
import 'package:tascom/core/networking/api_constants.dart';
import 'package:tascom/features/get_tasks/data/models/all_tasks_response.dart';

class GetTaskService {
  final Dio _dio;

  GetTaskService(this._dio);

  Future<TaskResponseData> getTask(int id) async {
    final response = await _dio.get('${ApiConstants.tasks}/$id');
    final data = response.data as Map<String, dynamic>;
    return TaskResponseData.fromJson(data['data'] as Map<String, dynamic>);
  }
}
