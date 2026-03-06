import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/networking/api_constants.dart';
import '../models/saved_tasks_response.dart';

part 'saved_tasks_service.g.dart';

@RestApi()
abstract class SavedTasksService {
  factory SavedTasksService(Dio dio) = _SavedTasksService;

  @GET(ApiConstants.getSavedTasks)
  Future<SavedTasksResponse> getSavedTasks();
}
