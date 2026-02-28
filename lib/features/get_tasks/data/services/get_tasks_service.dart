import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/all_tasks_response.dart';

part 'get_tasks_service.g.dart';

@RestApi()
abstract class GetTasksService {
  factory GetTasksService(Dio dio) = _GetTasksService;

  @GET(ApiConstants.tasks)
  Future<AllTasksResponse> getAllTasks(
    @Query('page') int page,
    @Query('limit') int limit, {
    @Query('category') String? category,
  });
}
